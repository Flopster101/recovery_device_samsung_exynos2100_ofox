# TWRP Device Tree for Samsung Galaxy S21 Series

The Galaxy S21 Series (codenamed _"r9s"_,_"o1s"_,_"t2s"_,_"p3s"_) is a family of flagship smartphones from Samsung.

They were announced and released in January 2021.

This device tree is compatible with all 3 devices: S21 5G, S21+ 5G, S21 Ultra 5G.

## Device specifications

| Feature                      | Specification                                                                      |
| ---------------------------: | :----------------------------------------------------------------------------------|
| Chipset                      | Exynos 2100                                                                        |
| CPU                          | Octa-core (1x2.91 GHz Cortex X1 & 3x2.81 GHz Cortex-A78 & 4x2.21 GHz Cortex-A55)  |
| GPU                          | Mali-G78 MP14                                                                      |
| Memory                       | 8GB/12GB/16GB RAM                                                                  |
| Shipped OS                   | Android 11 (One UI 3.1)                                                            |
| Storage                      | 128GB / 256GB / 512GB (UFS 3.1)                                                    |

## Kernel source 

Available at [https://github.com/xfwdrev/android_kernel_samsung_ex2100/](https://github.com/xfwdrev/android_kernel_samsung_ex2100)

## Bugs

- /data decryption in OneUI (works on AOSP)

## How to build

This device tree was tested and is fully compatible with [minimal-manifest-twrp](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp).

1. Set up the build environment following the instructions [here](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/blob/twrp-12.1/README.md#getting-started)

2. In the root folder of the fetched repo, clone the device tree specific to your model:

```bash
git clone https://github.com/xfwdrev/android_device_samsung_ex2100_TWRP.git -b t2s device/samsung/t2s
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