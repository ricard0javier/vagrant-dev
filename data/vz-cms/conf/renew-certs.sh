openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
-keyout /ricardovz/cms/conf/vz-cms.key \
-out /ricardovz/cms/conf/vz-cms.pem \
-subj "/C=UK/ST=London/L=London/O=Vierica Solutions LTD,/CN=ricardovz.com/OU=Direction/emailAddress=villanueva.ricardo@gmail.com"
