# docker-vsftpd-alpine
FTP Server image

http://vsftpd.beasts.org/vsftpd_conf.html:

anonymous_enable=NO Disable anonymous logins
local_enable Local Accounts can use ftp connections
chroot_local_user Local Users are placed in chroot jail
passwd_chroot_enable=YES jail is per user, derived from home path "."
write_enable=YES any FTP command allowed

No better way?
seccomp_sandbox=NO seccomp is to strict "500 OOPS: 500 OOPS: child died" https://bugzilla.redhat.com/show_bug.cgi?id=845980
pasv_enable=YES Data Connection
allow_writeable_chroot=NO fixes "Fixing 500 OOPS: vsftpd: refusing to run with writable root inside chroot"


pasv_address => set to ip for windows usage

thanks to
https://github.com/onjin/docker-alpine-vsftpd
onjin

