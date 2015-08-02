sudo -i

FAIL2BAN_VERSION=0.8.14

mkdir -p /usr/src/fail2ban
cd /usr/src/fail2ban

curl -o fail2ban.tar.gz -SL https://github.com/fail2ban/fail2ban/archive/$FAIL2BAN_VERSION.tar.gz
tar -xzf fail2ban.tar.gz
rm -f fail2ban.tar.gz
cd fail2ban-$FAIL2BAN_VERSION
python setup.py install

cp sshd.conf /etc/fail2ban/jail.d/jail.conf

exit