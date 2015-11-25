cp activ-i2c1.sh /usr/bin
cp activ-i2c1.service /lib/systemd
cd /etc/systemd/system/
ln /lib/systemd/activ-i2c1.service activ-i2c1.service
systemctl daemon-reload
systemctl start activ-i2c1.service
systemctl enable activ-i2c1.service