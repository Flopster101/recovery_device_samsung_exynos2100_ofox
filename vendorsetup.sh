#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# For building with minimal manifest
export ALLOW_MISSING_DEPENDENCIES=true

# Fox
export ALLOW_MISSING_DEPENDENCIES="true"
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
export FOX_VANILLA_BUILD="1"
export OF_SKIP_FBE_DECRYPTION="1"
export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
# Hopefully not important
# export OF_SCREEN_H="2340"
# export OF_STATUS_H="100"
# export OF_STATUS_INDENT_LEFT="48"
# export OF_STATUS_INDENT_RIGHT="48"
export OF_USE_MAGISKBOOT="1"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
export OF_SKIP_MULTIUSER_FOLDERS_BACKUP="1"
export LC_ALL="C"
export FOX_DELETE_AROMAFM="1"
export FOX_USE_TAR_BINARY="1"
export FOX_USE_SED_BINARY="1"
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
export FOX_USE_XZ_UTILS="1"
export FOX_REMOVE_AAPT="1"
export FOX_VARIANT="A12"
export FOX_SETTINGS_ROOT_DIRECTORY="/cache"
export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/cache"

_exynos2100_apply_recovery_patches() {
    local device_tree
    local recovery_tree
    local patch
    local subject

    device_tree="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    recovery_tree="$(cd "${device_tree}/../../.." && pwd)/bootable/recovery"

    if [ ! -d "${recovery_tree}/.git" ]; then
        echo "Skipping recovery patches: ${recovery_tree} is not a git repository"
        return 0
    fi

    for patch in "${device_tree}"/patches/*.patch; do
        [ -e "${patch}" ] || continue

        # 1. Forward check
        if git -C "${recovery_tree}" apply --check "${patch}" >/dev/null 2>&1; then
            echo "Applying recovery patch: $(basename "${patch}")"
            if ! git -C "${recovery_tree}" am --3way "${patch}"; then
                git -C "${recovery_tree}" am --abort >/dev/null 2>&1
                echo "Failed to apply recovery patch: $(basename "${patch}")"
                return 1
            fi
            continue
        fi

        # 2. Fallback check
        subject="$(sed -n 's/^Subject: \[PATCH[^]]*\] //p; s/^Subject: //p' "${patch}" | head -n 1 | xargs)"
        if [ -n "${subject}" ] && git -C "${recovery_tree}" log -n 50 --grep="${subject}" --format=%s | grep -q . ; then
            echo "Recovery patch already applied: $(basename "${patch}")"
            continue
        fi

        # 3. Attempt application with 3-way merge
        echo "Applying recovery patch (with 3-way merge): $(basename "${patch}")"
        if ! git -C "${recovery_tree}" am --3way "${patch}"; then
            git -C "${recovery_tree}" am --abort >/dev/null 2>&1
            echo "Failed to apply recovery patch (conflict?): $(basename "${patch}")"
            return 1
        fi
    done
}


_exynos2100_apply_recovery_patches
unset -f _exynos2100_apply_recovery_patches
