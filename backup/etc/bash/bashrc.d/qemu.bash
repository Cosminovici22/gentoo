qemu() {
	qemu-system-x86_64 \
		-machine type=q35,accel=kvm \
		-cpu host \
		-smp cores=4,threads=2 \
		-m 8G \
		-audio driver=pa,model=virtio \
		-drive file="${@:$#}",if=virtio,cache=none,aio=native \
		-usbdevice tablet \
		-display gtk,gl=on,show-cursor=on,full-screen=on \
		-nic tap,ifname=tap0,script=no,downscript=no,vhost=on,model=virtio-net-pci \
		-vga virtio \
		"${@:1:$#-1}"
}
