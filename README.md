# The following amends the Gentoo Handbook:
1. Before installation, format the NVMe drive: `nvme format --lbaf=1 /dev/nvme0n1`
2. An EFI system partition size of 300 MB should be enough for the FAT32 file system
3. ESP UUID `c12a7328-f81f-11d2-ba4b-00a0c93ec93b` and root partition UUID `4f68bce3-e8cd-4db1-96e7-fbcaf984b709`
4. After extracting the stage 3 tarball, copy the configuration files to root: `cp backup/* /mnt/gentoo/`
5. Use locale C.UTF-8: `eselect locale set C.UTF-8`
6. To compile and install the kernel:
```
emerge gentoo-sources efibootmgr
emerge -1 intel-microcode linux-firmware sof-firmware wireless-regdb
eselect kernel set 1
make oldconfig
make -j 12
make modules_install
mkdir -p /efi/EFI/Gentoo
command cp arch/x86_64/boot/bzImage /efi/EFI/Gentoo/bzImage.efi
efibootmgr -c -d /dev/nvme0n1 -p 1 -L "Gentoo" -l "\EFI\Gentoo\bzImage.efi" -u "i915.enable_guc=3 iwlwifi.power_save=1 iwlwifi.power_level=5 iwlmvm.power_scheme=3"
```
7. Don't disable root login and: `useradd -m -N -g users -G kvm,video,wheel -s /bin/bash default && passwd -d default`
8. Install essential packages and update the system:
```
emerge -1 eselect-repository
eselect repository enable steam-overlay
emerge --sync steam-overlay
emerge -uDN @world
emerge -c
eclean-dist --deep
eclean-pkg --deep
```
9. Miscellaneous configuration:
```
crontab /etc/crontab
hp-setup
lpoptions -d Deskjet_1510
rc-update add elogind boot
rc-update add sysklogd default
rc-update add dcron default
rc-update add ntpd default
rc-update add dhcpcd default
rc-update add iwd default
rc-update add bluetooth default
rc-update add nvidia-powerd default
rc-update add cupsd default
rc-update add osclock default
rc-update add iptables default
rc-update add ip6tables default
rc-update del hwclock boot
rc-update del netmount default
rc-udpate del swap boot
```
