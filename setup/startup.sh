###dns
echo "options single-request-reopen" >> /etc/resolv.conf;

###host
cat > /etc/hosts << EOF
127.0.0.1       localhost
EOF

###fonts
#\cp -r -f /usr/local/app/fonts/* /usr/share/fonts/;