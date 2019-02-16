FROM jusito/docker-vsftpd-alpine:base

ENV anonymous_enable=NO \
	chroot_local_user=YES \
	local_enable=YES \
	passwd_chroot_enable=YES \
	pasv_enable=YES \
	seccomp_sandbox=NO \
	write_enable=YES \
	\
	pasv_min_port=10090 \
	pasv_max_port=10100
	
EXPOSE 20 21 10090-10100