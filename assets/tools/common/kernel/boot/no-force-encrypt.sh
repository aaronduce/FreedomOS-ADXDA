#!/sbin/sh
# Copyright 2016 Antoine GRAVELOT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

found_fstab=false

if [ -f /system/vendor/etc/fstab.qcom ]; then
    cd /system/vendor/etc/
else
    cd /tmp/ramdisk
fi

for fstab in fstab.*; do
	[ -f "$fstab" ] || continue
	echo "Found fstab: $fstab"
	sed -i "
		s/\b\(forceencrypt\|forcefdeorfbe\)=/encryptable=/g
	" "$fstab"
	found_fstab=true
done

$found_fstab || echo "Unable to find the fstab!"

exit 0
