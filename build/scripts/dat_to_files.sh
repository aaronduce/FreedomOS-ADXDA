#!/bin/bash
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

# FreedomOS device build script
# Contributors : TimVNL, Mavy

function dat_to_files {

  # Building Process
  echo "> $device build starting now with $BUILD_METHOD build method." 2>&1 | tee -a ${build_log}

  echo ">> Copying ${ROM_NAME} needed files" 2>&1 | tee -a ${build_log}
  cp -rv ${rom_root}/${device}/${ROM_NAME}/{RADIO/,firmware-update/,boot.img} ${tmp_root}/ >> ${build_log} 2>&1  mkdir -p ${tmp_root}/mount >> ${build_log} 2>&1
  mkdir -p ${tmp_root}/mount >> ${build_log} 2>&1
  mkdir -p ${tmp_root}/system >> ${build_log} 2>&1

  echo ">> Extracting system.new.dat" 2>&1 | tee -a ${build_log}
  ${build_root}/tools/sdat2img.py ${rom_root}/${device}/${ROM_NAME}/system.transfer.list ${rom_root}/${device}/${ROM_NAME}/system.new.dat ${tmp_root}/system.img >> ${build_log} 2>&1

  echo ">> Mounting system.img" 2>&1 | tee -a ${build_log}
  mount -t ext4 -o loop ${tmp_root}/system.img ${tmp_root}/mount/ >> ${build_log} 2>&1

  echo ">>> Extracting system files" 2>&1 | tee -a ${build_log}
  cp -rvf ${tmp_root}/mount/* ${tmp_root}/system/ >> ${build_log} 2>&1

  echo ">> Cleaning build root " 2>&1 | tee -a ${build_log}
  if mount | grep "${tmp_root}/mount" > /dev/null;
  then
      echo ">> Unmounting system.img" 2>&1 | tee -a ${build_log}
      sleep 2
      umount ${tmp_root}/mount/ >> ${build_log} 2>&1
  fi
  rm -rvf ${tmp_root}/mount >> ${build_log} 2>&1
  rm -rvf ${tmp_root}/system.* >> ${build_log} 2>&1

  if [ ! -z "${CLEAN_SYSTEM_LIST}" ]; then
    echo "> Removing unneeded system files" 2>&1 | tee -a ${build_log}
    for i in ${CLEAN_SYSTEM_LIST}
    do
      rm -rvf ${tmp_root}/system/${i} >> ${build_log} 2>&1
    done
  fi

  if [ ! -z "${ADD_SYSTEM_COMMON_LIST}" ]; then
    echo ">>> Patching system files [COMMON]" 2>&1 | tee -a ${build_log}
    for i in ${ADD_SYSTEM_COMMON_LIST}
    do
      cp -vf ${assets_root}/system/common/${i} ${tmp_root}/mount/${i} >> ${build_log} 2>&1
      if [ -f ${tmp_root}/mount/bin/dpi ]; then
        chmod +x ${tmp_root}/mount/bin/dpi
      fi
    done
  fi

  if [ ! -z "${ADD_SYSTEM_LIST}" ]; then
    echo ">>> Patching system files [${TARGET_ARCH}]" 2>&1 | tee -a ${build_log}
    for i in ${ADD_SYSTEM_LIST}
    do
      mkdir -p ${tmp_root}/system/${i}
      cp -rvf ${assets_root}/system/${TARGET_ARCH}/${i}/* ${tmp_root}/system/${i} >> ${build_log} 2>&1
    done
  fi

  if [ ! -z "${ADD_DATA_LIST}" ]; then
    echo ">>> Patching system files [${TARGET_ARCH}]" 2>&1 | tee -a ${build_log}
    for i in ${ADD_DATA_LIST}
    do
      mkdir -p ${tmp_root}/data/${i}  >> ${build_log} 2>&1
      cp -rvf ${assets_root}/system/${TARGET_ARCH}/${i}/* ${tmp_root}/data/${i} >> ${build_log} 2>&1
    done
  fi

  if [ -d "${assets_root}/system/${DEVICE}" ]; then
    echo ">>> Patching system files for ${DEVICE}" 2>&1 | tee -a ${build_log}
    cp -rvf ${assets_root}/system/${DEVICE}/* ${tmp_root}/mount/ >> ${build_log} 2>&1
  fi

  echo ro.sf.lcd_density=480 >> ${tmp_root}/mount/build.prop | tee -a ${build_log}
}
