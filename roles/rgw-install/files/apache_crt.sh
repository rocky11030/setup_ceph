#!/usr/bin/expect
spawn openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
expect "Country Name (2 letter code) \[AU\]:"
#expect "Country Name (2 letter code)"
send "\r"
expect "State or Province Name (full name) \[Some-State\]:"
send "\r"
expect "Locality Name (eg, city) []:"
send "\r"
expect "Organization Name (eg, company) \[Internet Widgits Pty Ltd\]:"
send "\r"
expect "Organizational Unit Name (eg, section) []:"
send "\r"
expect "Common Name (e.g. server FQDN or YOUR name) []:"
send "\r"
expect "Email Address []:"
send "\r"
expect eof
exit
