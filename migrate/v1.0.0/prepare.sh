mkdir downloads

if [ ! -f downloads/migrate.linux-amd64.deb ]; then
wget https://github.com/golang-migrate/migrate/releases/download/v4.16.2/migrate.linux-amd64.deb -O downloads/migrate.linux-amd64.deb
fi