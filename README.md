# FTP Server VSFTPD meets alpine
FTP Server image with: (http://vsftpd.beasts.org)
State: Working but could be improved here and there.

## Getting Started
``` 
Syntax: docker -d [Options] jusito/ddocker-vsftpd-alpine:*TAG*
```
1. Which use case? Choose your Tag below.
2. Pick name & password. `-e MY_NAME="docker" -e MY_PASSWORD="MySecurePW"`
3. Which ID do the data have or should they keep? `-e MY_USER_ID="124" -e MY_GROUP_ID="124"`
4. Give me 12 ports (20, 21, 10090-10100 in the container): `-p 10020:20 -p 10021:21 -p 10090-10100:10090-10100`
5. Volume to access? `-v VolumeToManage:/home/*USER*/`

### Example:
* Only one user 
* FTP Login docker, password MySecurePW
* Data uploaded should be owned by user 124 and group 124
* External ports are 10020, 10021, 10090-10100
* A volume with existing data or a new volume should be used

```
docker run -it --rm \
 -e MY_NAME="docker" -e MY_PASSWORD="MySecurePW" \
 -e MY_USER_ID="10000" -e MY_GROUP_ID="10000" \
 -e pasv_address="YourHostIP(not domain)" \
 -p 10020:20 -p 10021:21 -p 10090-10100:10090-10100 \
 -v VolumeToManage:/home/docker/ \
 jusito/docker-vsftpd-alpine:simple
```

### Example with Windows:
You need: `-e pasv_address="YourHostIP(not domain)"`

```
docker run -it --rm \
 -e MY_NAME="docker" -e MY_PASSWORD="MySecurePW" \
 -e MY_USER_ID="10000" -e MY_GROUP_ID="10000" \
 -p 10020:20 -p 10021:21 -p 10090-10100:10090-10100 \
 -v VolumeToManage:/home/docker/ \
 -e pasv_address="YourHostIP(not domain)" \
 jusito/docker-vsftpd-alpine:simple
```


## Tags

### simple
= one user
= for windows / linux / filezilla...
- no SSL
- no seccomp / ...

### base
Contains every (config variable with default)[http://vsftpd.beasts.org/vsftpd_conf.html]:

## Environment Variables

(all variables from x, all default values)[http://vsftpd.beasts.org/vsftpd_conf.html]:

### windows mount

pasv_address => set to ip for windows usage
thanks to
https://github.com/onjin/docker-alpine-vsftpd

### free to change

<details><summary>VSFTPD Configuration (click me)</summary>
<p>
Not in man page, but needed for dockerize:

|Name|Default|
|----|-------|
|seccomp\_sandbox|YES|
|allow\_writeable\_chroot|YES|

In man page:

|Name|Default|
|----|-------|
|allow\_anon\_ssl|NO|
|anon\_mkdir\_write\_enable|NO|
|anon\_other\_write\_enable|NO|
|anon\_upload\_enable|NO|
|anon\_world\_readable\_only|YES|
|anonymous\_enable|YES|
|ascii\_download\_enable|NO|
|ascii\_upload\_enable|NO|
|async\_abor\_enable|NO|
|background|NO|
|check\_shell|YES|
|chmod\_enable|YES|
|chown\_uploads|NO|
|chroot\_list\_enable|NO|
|chroot\_local\_user|NO|
|connect\_from\_port\_20|NO|
|debug\_ssl|NO|
|delete\_failed\_uploads|NO|
|deny\_email\_enable|NO|
|dirlist\_enable|YES|
|dirmessage\_enable|NO|
|download\_enable|YES|
|dual\_log\_enable|NO|
|force\_dot\_files|NO|
|force\_anon\_data\_ssl|NO|
|force\_anon\_logins\_ssl|NO|
|force\_local\_data\_ssl|YES|
|force\_local\_logins\_ssl|YES|
|guest\_enable|NO|
|hide\_ids|NO|
|implicit\_ssl|NO|
|listen|YES|
|listen\_ipv6|NO|
|local\_enable|NO|
|lock\_upload\_files|YES|
|log\_ftp\_protocol|NO|
|ls\_recurse\_enable|NO|
|mdtm\_write|YES|
|no\_anon\_password|NO|
|no\_log\_lock|NO|
|one\_process\_model|NO|
|passwd\_chroot\_enable|NO|
|pasv\_addr\_resolve|NO|
|pasv\_enable|YES|
|pasv\_promiscuous|NO|
|port\_enable|YES|
|port\_promiscuous|NO|
|require\_cert|NO|
|require\_ssl\_reuse|YES|
|run\_as\_launching\_user|NO|
|secure\_email\_list\_enable|NO|
|session\_support|NO|
|setproctitle\_enable|NO|
|ssl\_enable|NO|
|ssl\_request\_cert|YES|
|ssl\_sslv2|NO|
|ssl\_sslv3|NO|
|ssl\_tlsv1|YES|
|strict\_ssl\_read\_eof|NO|
|strict\_ssl\_write\_shutdown|NO|
|syslog\_enable|NO|
|tcp\_wrappers|NO|
|text\_userdb\_names|NO|
|tilde\_user\_enable|NO|
|use\_localtime|NO|
|use\_sendfile|YES|
|userlist\_deny|YES|
|userlist\_enable|NO|
|validate\_cert|NO|
|virtual\_use\_local\_privs|NO|
|write\_enable|NO|
|xferlog\_enable|NO|
|xferlog\_std\_format|NO|
|accept\_timeout|60|
|anon\_max\_rate|0|
|anon\_umask|077|
|chown\_upload\_mode|0600|
|connect\_timeout|60|
|data\_connection\_timeout|300|
|delay\_failed\_login|1|
|delay\_successful\_login|0|
|file\_open\_mode|0666|
|ftp\_data\_port|20|
|idle\_session\_timeout|300|
|listen\_port|21|
|local\_max\_rate|0|
|local\_umask|077|
|max\_clients|0|
|max\_login\_fails|3|
|max\_per\_ip|0|
|pasv\_max\_port|0|
|pasv\_min\_port|0|
|trans\_chunk\_size|0|
|anon\_root|""|
|banned\_email\_file|"/etc/vsftpd.banned\_emails"|
|banner\_file|""|
|ca\_certs\_file|""|
|chown\_username|"root"|
|chroot\_list\_file|"/etc/vsftpd.chroot\_list"|
|cmds\_allowed|""|
|cmds\_denied|""|
|deny\_file|""|
|dsa\_cert\_file|""|
|dsa\_private\_key\_file|""|
|email\_password\_file|"/etc/vsftpd.email\_passwords"|
|ftp\_username|"ftp"|
|ftpd\_banner|""|
|guest\_username|"ftp"|
|hide\_file|""|
|listen\_address|""|
|listen\_address6|""|
|local\_root|""|
|message\_file|".message"|
|nopriv\_user|"nobody"|
|pam\_service\_name|"ftp"|
|pasv\_address|""|
|rsa\_cert\_file|"/usr/share/ssl/certs/vsftpd.pem"|
|rsa\_private\_key\_file|""|
|secure\_chroot\_dir|"/usr/share/empty"|
|ssl\_ciphers|"DES-CBC3-SHA"|
|user\_config\_dir|""|
|user\_sub\_token|""|
|userlist\_file|"/etc/vsftpd.user\_list"|
|vsftpd\_log\_file|"/var/log/vsftpd.log"|
|xferlog\_file|"/var/log/xferlog"|

</p>
</details>

### internal (please don't change)

<details><summary>VSFTPD Configuration (click me)</summary>
<p>

|Name|Default|
|----|-------|
|MY\_GROUP\_ID|10000|
|MY\_USER\_ID|10000|
|MY\_NAME|docker|
|MY\_PASSWORD|""|
|TEST\_MODE|false|
|DEBUGGING|false|
|CONFIG\_FILE|"/etc/vsftpd/vsftpd.conf"|
	
</p>
</details>


## Additional Informations
### Bug Windows 
pasv_address => set to ip for windows usage
(thanks to onjin@git)[https://github.com/onjin/docker-alpine-vsftpd]
Example Mount: ftp://1.2.3.4:10021

### FAQ

* seccomp_sandbox=NO ? (500 OOPS: 500 OOPS: child died)[https://bugzilla.redhat.com/show_bug.cgi?id=845980]
* anonymous_enable=YES ? Username: anonymous
* allow\_writeable\_chroot=NO & chroot\_local\_user=NO? 500 OOPS: vsftpd: refusing to run with writable root inside chroot
* pasv_enable=YES ? Data Connection
* write\_enable=YES ? any FTP command allowed
* passwd\_chroot\_enable=YES ? jail is per user, derived from home path "."
* local\_enable=YES ? Local Accounts can use ftp connections
* local_umask ? Permissions
