#!/bin/sh

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

setVariable() {
	key=$1
	value=$2
	pattern=$3
	default=$4
	target="$CONFIG_FILE"
	
	if ! echo "$value" | grep -Eiq "$pattern"; then
		echo "illegal value($value) for $key, fallback to ($default), used regex pattern $pattern"
		value="$default"
	fi
	
	if [ "$value" = "$default" ]; then
		echo "Property: $key=$value (Default)"
	else
		echo "Property: $key=$value"
		echo "$key=$value" >> "$target"
	fi
	
}

setConfig() {
	target="$CONFIG_FILE"
	
	if [ -e "$target" ]; then
		rm "$target"
	fi
	touch "$target"
	
	# pattern
	patternBoolean="^(YES|NO)$"
	patternNumber="^\d+$"
	patternString="^.*$"
	
	# boolean values
	setVariable "allow_anon_ssl" "${allow_anon_ssl:?}" "$patternBoolean" "NO"
	setVariable "anon_mkdir_write_enable" "${anon_mkdir_write_enable:?}" "$patternBoolean" "NO"
	setVariable "anon_other_write_enable" "${anon_other_write_enable:?}" "$patternBoolean" "NO"
	setVariable "anon_upload_enable" "${anon_upload_enable:?}" "$patternBoolean" "NO"
	setVariable "anon_world_readable_only" "${anon_world_readable_only:?}" "$patternBoolean" "YES"
	setVariable "anonymous_enable" "${anonymous_enable:?}" "$patternBoolean" "YES"
	setVariable "ascii_download_enable" "${ascii_download_enable:?}" "$patternBoolean" "NO"
	setVariable "ascii_upload_enable" "${ascii_upload_enable:?}" "$patternBoolean" "NO"
	setVariable "async_abor_enable" "${async_abor_enable:?}" "$patternBoolean" "NO"
	setVariable "background" "${background:?}" "$patternBoolean" "NO"
	setVariable "check_shell" "${check_shell:?}" "$patternBoolean" "YES"
	setVariable "chmod_enable" "${chmod_enable:?}" "$patternBoolean" "YES"
	setVariable "chown_uploads" "${chown_uploads:?}" "$patternBoolean" "NO"
	setVariable "chroot_list_enable" "${chroot_list_enable:?}" "$patternBoolean" "NO"
	setVariable "chroot_local_user" "${chroot_local_user:?}" "$patternBoolean" "NO"
	setVariable "connect_from_port_20" "${connect_from_port_20:?}" "$patternBoolean" "NO"
	setVariable "debug_ssl" "${debug_ssl:?}" "$patternBoolean" "NO"
	setVariable "delete_failed_uploads" "${delete_failed_uploads:?}" "$patternBoolean" "NO"
	setVariable "deny_email_enable" "${deny_email_enable:?}" "$patternBoolean" "NO"
	setVariable "dirlist_enable" "${dirlist_enable:?}" "$patternBoolean" "YES"
	setVariable "dirmessage_enable" "${dirmessage_enable:?}" "$patternBoolean" "NO"
	setVariable "download_enable" "${download_enable:?}" "$patternBoolean" "YES"
	setVariable "dual_log_enable" "${dual_log_enable:?}" "$patternBoolean" "NO"
	setVariable "force_dot_files" "${force_dot_files:?}" "$patternBoolean" "NO"
	setVariable "force_anon_data_ssl" "${force_anon_data_ssl:?}" "$patternBoolean" "NO"
	setVariable "force_anon_logins_ssl" "${force_anon_logins_ssl:?}" "$patternBoolean" "NO"
	setVariable "force_local_data_ssl" "${force_local_data_ssl:?}" "$patternBoolean" "YES"
	setVariable "force_local_logins_ssl" "${force_local_logins_ssl:?}" "$patternBoolean" "YES"
	setVariable "guest_enable" "${guest_enable:?}" "$patternBoolean" "NO"
	setVariable "hide_ids" "${hide_ids:?}" "$patternBoolean" "NO"
	setVariable "implicit_ssl" "${implicit_ssl:?}" "$patternBoolean" "NO"
	setVariable "listen" "${listen:?}" "$patternBoolean" "YES"
	setVariable "listen_ipv6" "${listen_ipv6:?}" "$patternBoolean" "NO"
	setVariable "local_enable" "${local_enable:?}" "$patternBoolean" "NO"
	setVariable "lock_upload_files" "${lock_upload_files:?}" "$patternBoolean" "YES"
	setVariable "log_ftp_protocol" "${log_ftp_protocol:?}" "$patternBoolean" "NO"
	setVariable "ls_recurse_enable" "${ls_recurse_enable:?}" "$patternBoolean" "NO"
	setVariable "mdtm_write" "${mdtm_write:?}" "$patternBoolean" "YES"
	setVariable "no_anon_password" "${no_anon_password:?}" "$patternBoolean" "NO"
	setVariable "no_log_lock" "${no_log_lock:?}" "$patternBoolean" "NO"
	setVariable "one_process_model" "${one_process_model:?}" "$patternBoolean" "NO"
	setVariable "passwd_chroot_enable" "${passwd_chroot_enable:?}" "$patternBoolean" "NO"
	setVariable "pasv_addr_resolve" "${pasv_addr_resolve:?}" "$patternBoolean" "NO"
	setVariable "pasv_enable" "${pasv_enable:?}" "$patternBoolean" "YES"
	setVariable "pasv_promiscuous" "${pasv_promiscuous:?}" "$patternBoolean" "NO"
	setVariable "port_enable" "${port_enable:?}" "$patternBoolean" "YES"
	setVariable "port_promiscuous" "${port_promiscuous:?}" "$patternBoolean" "NO"
	setVariable "require_cert" "${require_cert:?}" "$patternBoolean" "NO"
	setVariable "require_ssl_reuse" "${require_ssl_reuse:?}" "$patternBoolean" "YES"
	setVariable "run_as_launching_user" "${run_as_launching_user:?}" "$patternBoolean" "NO"
	setVariable "secure_email_list_enable" "${secure_email_list_enable:?}" "$patternBoolean" "NO"
	setVariable "session_support" "${session_support:?}" "$patternBoolean" "NO"
	setVariable "setproctitle_enable" "${setproctitle_enable:?}" "$patternBoolean" "NO"
	setVariable "ssl_enable" "${ssl_enable:?}" "$patternBoolean" "NO"
	setVariable "ssl_request_cert" "${ssl_request_cert:?}" "$patternBoolean" "YES"
	setVariable "ssl_sslv2" "${ssl_sslv2:?}" "$patternBoolean" "NO"
	setVariable "ssl_sslv3" "${ssl_sslv3:?}" "$patternBoolean" "NO"
	setVariable "ssl_tlsv1" "${ssl_tlsv1:?}" "$patternBoolean" "YES"
	setVariable "strict_ssl_read_eof" "${strict_ssl_read_eof:?}" "$patternBoolean" "NO"
	setVariable "strict_ssl_write_shutdown" "${strict_ssl_write_shutdown:?}" "$patternBoolean" "NO"
	setVariable "syslog_enable" "${syslog_enable:?}" "$patternBoolean" "NO"
	setVariable "tcp_wrappers" "${tcp_wrappers:?}" "$patternBoolean" "NO"
	setVariable "text_userdb_names" "${text_userdb_names:?}" "$patternBoolean" "NO"
	setVariable "tilde_user_enable" "${tilde_user_enable:?}" "$patternBoolean" "NO"
	setVariable "use_localtime" "${use_localtime:?}" "$patternBoolean" "NO"
	setVariable "use_sendfile" "${use_sendfile:?}" "$patternBoolean" "YES"
	setVariable "userlist_deny" "${userlist_deny:?}" "$patternBoolean" "YES"
	setVariable "userlist_enable" "${userlist_enable:?}" "$patternBoolean" "NO"
	setVariable "validate_cert" "${validate_cert:?}" "$patternBoolean" "NO"
	setVariable "virtual_use_local_privs" "${virtual_use_local_privs:?}" "$patternBoolean" "NO"
	setVariable "write_enable" "${write_enable:?}" "$patternBoolean" "NO"
	setVariable "xferlog_enable" "${xferlog_enable:?}" "$patternBoolean" "NO"
	setVariable "xferlog_std_format" "${xferlog_std_format:?}" "$patternBoolean" "NO"
	
	# numerical
	setVariable "accept_timeout" "${accept_timeout:?}" "$patternNumber" "60"
	setVariable "anon_max_rate" "${anon_max_rate:?}" "$patternNumber" "0"
	setVariable "anon_umask" "${anon_umask:?}" "$patternNumber" "077"
	setVariable "chown_upload_mode" "${chown_upload_mode:?}" "$patternNumber" "0600"
	setVariable "connect_timeout" "${connect_timeout:?}" "$patternNumber" "60"
	setVariable "data_connection_timeout" "${data_connection_timeout:?}" "$patternNumber" "300"
	setVariable "delay_failed_login" "${delay_failed_login:?}" "$patternNumber" "1"
	setVariable "delay_successful_login" "${delay_successful_login:?}" "$patternNumber" "0"
	setVariable "file_open_mode" "${file_open_mode:?}" "$patternNumber" "0666"
	setVariable "ftp_data_port" "${ftp_data_port:?}" "$patternNumber" "20"
	setVariable "idle_session_timeout" "${idle_session_timeout:?}" "$patternNumber" "300"
	setVariable "listen_port" "${listen_port:?}" "$patternNumber" "21"
	setVariable "local_max_rate" "${local_max_rate:?}" "$patternNumber" "0"
	setVariable "local_umask" "${local_umask:?}" "$patternNumber" "077"
	setVariable "max_clients" "${max_clients:?}" "$patternNumber" "0"
	setVariable "max_login_fails" "${max_login_fails:?}" "$patternNumber" "3"
	setVariable "max_per_ip" "${max_per_ip:?}" "$patternNumber" "0"
	setVariable "pasv_max_port" "${pasv_max_port:?}" "$patternNumber" "0"
	setVariable "pasv_min_port" "${pasv_min_port:?}" "$patternNumber" "0"
	setVariable "trans_chunk_size" "${trans_chunk_size:?}" "$patternNumber" "0"
	
	# strings
	# shellcheck disable=SC2154
	setVariable "anon_root" "$anon_root" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "banned_email_file" "${banned_email_file}" "$patternString" "/etc/vsftpd.banned_emails"
	# shellcheck disable=SC2154
	setVariable "banner_file" "$banner_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "ca_certs_file" "$ca_certs_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "chown_username" "${chown_username}" "$patternString" "root"
	# shellcheck disable=SC2154
	setVariable "chroot_list_file" "${chroot_list_file}" "$patternString" "/etc/vsftpd.chroot_list"
	# shellcheck disable=SC2154
	setVariable "cmds_allowed" "$cmds_allowed" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "cmds_denied" "$cmds_denied" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "deny_file" "$deny_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "dsa_cert_file" "$dsa_cert_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "dsa_private_key_file" "$dsa_private_key_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "email_password_file" "${email_password_file}" "$patternString" "/etc/vsftpd.email_passwords"
	# shellcheck disable=SC2154
	setVariable "ftp_username" "${ftp_username}" "$patternString" "ftp"
	# shellcheck disable=SC2154
	setVariable "ftpd_banner" "$ftpd_banner" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "guest_username" "${guest_username}" "$patternString" "ftp"
	# shellcheck disable=SC2154
	setVariable "hide_file" "$hide_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "listen_address" "$listen_address" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "listen_address6" "$listen_address6" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "local_root" "$local_root" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "message_file" "${message_file}" "$patternString" ".message"
	# shellcheck disable=SC2154
	setVariable "nopriv_user" "${nopriv_user}" "$patternString" "nobody"
	# shellcheck disable=SC2154
	setVariable "pam_service_name" "${pam_service_name}" "$patternString" "ftp"
	# shellcheck disable=SC2154
	setVariable "pasv_address" "${pasv_address}" "$patternString" "" #$(/sbin/ip route|awk '/default/ { print $3 }')
	# shellcheck disable=SC2154
	setVariable "rsa_cert_file" "${rsa_cert_file}" "$patternString" "/usr/share/ssl/certs/vsftpd.pem"
	# shellcheck disable=SC2154
	setVariable "rsa_private_key_file" "$rsa_private_key_file" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "secure_chroot_dir" "${secure_chroot_dir}" "$patternString" "/usr/share/empty"
	# shellcheck disable=SC2154
	setVariable "ssl_ciphers" "${ssl_ciphers}" "$patternString" "DES-CBC3-SHA"
	# shellcheck disable=SC2154
	setVariable "user_config_dir" "$user_config_dir" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "user_sub_token" "$user_sub_token" "$patternString" ""
	# shellcheck disable=SC2154
	setVariable "userlist_file" "${userlist_file}" "$patternString" "/etc/vsftpd.user_list"
	# shellcheck disable=SC2154
	setVariable "vsftpd_log_file" "${vsftpd_log_file}" "$patternString" "/var/log/vsftpd.log"
	# shellcheck disable=SC2154
	setVariable "xferlog_file" "${xferlog_file}" "$patternString" "/var/log/xferlog"
	
	# needed for dockerize
	setVariable "seccomp_sandbox" "${seccomp_sandbox:?}" "$patternBoolean" "YES"
	# shellcheck disable=SC2154
	setVariable "allow_writeable_chroot" "${allow_writeable_chroot:?}" "$patternBoolean" "NO"
}

createUser() {
	addgroup -g "$MY_GROUP_ID" "$MY_NAME"
	adduser -h "/home/$MY_NAME" -g "" -s "/bin/false" -G "$MY_NAME" -D -u "$MY_USER_ID" "$MY_NAME"
	
	if [ -z "$MY_PASSWORD" ]; then
		MY_PASSWORD=$( < /dev/urandom tr -dc A-Za-z0-9 | head -c8; echo; )
  		echo "Your Password: ${MY_PASSWORD}"
	fi
	echo "${MY_NAME}:${MY_PASSWORD}" | /usr/sbin/chpasswd
}

# check for test mode
if [ "$TEST_MODE" = "true" ]; then
	echo "[entrypoint][INFO]TEST_MODE = true"
fi

# preparation
createUser
setConfig

trap 'pkill -15 vsftpd' 15
/usr/sbin/vsftpd "$CONFIG_FILE" &

# on test mode check if server is up
if [ "$TEST_MODE" = "true" ]; then
	echo "[entrypoint][INFO]starting entrypointTestMode"
	sh "/home/entrypointTestMode.sh"

# on normal mode, just wait until end / trap
else
	echo "vsftpd started"
	wait "$!"
	echo "Vsftpd ended"
fi
