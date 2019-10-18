# FTP Server VSFTPD meets alpine
FTP Server image with: (http://vsftpd.beasts.org)
[![Build Status](https://travis-ci.org/jusito/ddocker-vsftpd-alpine.svg?branch=master)](https://travis-ci.org/jusito/docker-vsftpd-alpine)

## Getting Started
``` 
Syntax: docker -d [Options] jusito/ddocker-vsftpd-alpine:*TAG*
```
1. Which use case? Choose your Tag below.
2. Pick name & password. `-e MY_NAME="docker" -e MY_PASSWORD="123"`
3. Which UserID / GroupID? `-e MY_USER_ID="124" -e MY_GROUP_ID="124"`
4. Give me 12 ports (20, 21, 10090-10100 in the container): `-p 10020:20 -p 10021:21 -p 10090-10100:10090-10100`
5. Persistent data? `-v MyFTPServer:/home/*USER*/`

### Example:
* Only one user
* FTP Login docker, password 123
* Data uploaded should be owned by user 124 and group 124
* External ports are 10020, 10021, 10090-10100
* A volume with existing data or a new volume should be used

```
docker run -d \
 -e MY_NAME="docker" -e MY_PASSWORD="123" \
 -e MY_USER_ID="124" -e MY_GROUP_ID="124" \
 -p 10020:20 -p 10021:21 -p 10090-10100:10090-10100 \
 -v MyFTPServer:/home/docker/ \
 jusito/docker-vsftpd-alpine:simple
```

## Tags

### simple
One user, fast setup, for windows 

### base
...

## Environment Variables
all variables from x, all default values
http://vsftpd.beasts.org/vsftpd_conf.html:

anonymous_enable=NO Disable anonymous logins
local_enable Local Accounts can use ftp connections
chroot_local_user Local Users are placed in chroot jail
passwd_chroot_enable=YES jail is per user, derived from home path "."
write_enable=YES any FTP command allowed

No better way?
seccomp_sandbox=NO seccomp is to strict "500 OOPS: 500 OOPS: child died" https://bugzilla.redhat.com/show_bug.cgi?id=845980
pasv_enable=YES Data Connection
allow_writeable_chroot=NO chroot_local_user=NO, fixes "Fixing 500 OOPS: vsftpd: refusing to run with writable root inside chroot"

## Additional Informations
### Bug Windows 
pasv_address => set to ip for windows usage

thanks to
https://github.com/onjin/docker-alpine-vsftpd
onjin
### "500 OOPS: 500 OOPS: child died" 

### Bug allow_writeable_chroot

### set permissions 
local_umask
