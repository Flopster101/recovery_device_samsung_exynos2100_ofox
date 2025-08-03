# TWRP Device Tree for Samsung Galaxy S21 Series

## Device specifications

| Branding Name                             | Model Number          | Internal Codename         |
| :---------------------------------------- | :-------------------- | :------------------------ |
| Samsung Galaxy S21 FE 5G (INTL/Korean)    | SM-G990E              | r9s                       |
| Samsung Galaxy S21 5G (INTL/Korean)       | SM-G991B / SM-G991N   | o1s / o1sks               |
| Samsung Galaxy S21+ 5G (INTL/Korean)      | SM-G996B / SM-G996N   | t2s / t2sks               |
| Samsung Galaxy S21 Ultra 5G (INTL/Korean) | SM-G998B / SM-G998N   | p3s / p3sks               |

## Kernel source 

Available at [https://github.com/xfwdrev/android_kernel_samsung_ex2100/](https://github.com/xfwdrev/android_kernel_samsung_ex2100)

- Note: The kernel has been compiled with the --recovery flag set to y.

## Bugs

- /data decryption

## How to build

This device tree was tested and is fully compatible with [Orangefox](https://wiki.orangefox.tech).

1. Set up the build environment following the instructions [here](https://wiki.orangefox.tech/en/dev/building)

2. In the root folder of the fetched repo, clone the device tree:

```bash
git clone https://github.com/xfwdrev/android_device_samsung_exynos2100_ofox.git -b android-12.1 device/samsung/exynos2100
```

3. To build:

```bash
. build/envsetup.sh
lunch twrp_t2s-eng
mka recoveryimage
```

## Copyright

```
#
# Copyright (C) 2024 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
```