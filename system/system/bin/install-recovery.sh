#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:9795586cec73a6d41e18c8d2a250eba95959a08c; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:fa1aa6667348296794df9e257d302925245060e8 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:9795586cec73a6d41e18c8d2a250eba95959a08c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
