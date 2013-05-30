# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2013 The CyanogenMod Project
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
#
#
# This leverages the loki_patch utility created by djrbliss which allows us
# to bypass the bootloader checks on jfltevzw and jflteatt
# See here for more information on loki: https://github.com/djrbliss/loki
#

"""Custom OTA commands for jf devices with locked bootloaders"""

def FullOTA_InstallEnd(info):
  info.script.script = [cmd for cmd in info.script.script if not "boot.img" in cmd]
  info.script.script = [cmd for cmd in info.script.script if not "show_progress(0.100000, 0);" in cmd]
  info.script.AppendExtra('package_extract_file("system/bin/loki.sh", "/tmp/loki.sh");')
  info.script.AppendExtra('package_extract_file("system/bin/loki_patch", "/tmp/loki_patch");')
  info.script.AppendExtra('package_extract_file("system/bin/loki_flash", "/tmp/loki_flash");')
  info.script.AppendExtra('package_extract_file("system/etc/valid_bootloaders", "/tmp/valid_bootloaders");')
  info.script.AppendExtra('package_extract_file("boot.img", "/tmp/boot.img");')
  info.script.AppendExtra('set_perm(0, 0, 0777, "/tmp/loki.sh");')
  info.script.AppendExtra('set_perm(0, 0, 0777, "/tmp/loki_patch");')
  info.script.AppendExtra('set_perm(0, 0, 0777, "/tmp/loki_flash");')
  info.script.AppendExtra('assert(run_program("/tmp/loki.sh") == 0);')
  info.script.AppendExtra('delete("/system/bin/loki.sh");')
  info.script.AppendExtra('delete("/system/etc/valid_bootloaders");')
