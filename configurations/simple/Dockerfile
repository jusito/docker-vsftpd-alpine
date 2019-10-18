FROM jusito/vsftpd-alpine:base

ENV anonymous_enable=NO \
	local_enable=YES \
	passwd_chroot_enable=YES \
	pasv_enable=YES \
	write_enable=YES \
	\
	pasv_min_port=10090 \
	pasv_max_port=10100 \
	\
	seccomp_sandbox=NO \
	allow_writeable_chroot=NO
	
EXPOSE 20 21 10090-10100