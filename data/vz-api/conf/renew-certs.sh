openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
-keyout /ricardovz/api/conf/vz-api.key \
-out /ricardovz/api/conf/vz-api.pem \
-subj "/C=UK/ST=London/L=London/O=Vierica Solutions LTD,/CN=ricardovz.com/OU=Direction/emailAddress=villanueva.ricardo@gmail.com"
