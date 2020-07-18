## Install from github
```
user@webserver:~$ git clone https://github.com/letsencrypt/letsencrypt
user@webserver:~$ cd letsencrypt
user@webserver:~/letsencrypt$ ./letsencrypt-auto --help
```

## (alternative) Install w/ apt on Ubuntu
```
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt-get install letsencrypt
```

## Serve challenge files w/ lighttp
`sudo apt-get install lighttpd`

lighttpd is now running as a service
lighttpd uses /var/www as the web root by default

## Generate the cert
`./letsencrypt-auto certonly --webroot --webroot-path /var/www -d foo.example.com`

Certs are now saved in /etc/letsencrypt

## Convert them to p12 for use with spring-boot applications
`openssl pkcs12 -export -in fullchain.pem -inkey privkey.pem -out keystore.p12 -name tomcat -CAfile chain.pem -caname root`

Give it a keystore password when prompted and use that as the 'server.ssl.key-store-password' spring boot property

## Automatically renew all certs
`./letsencrypt-auto renew`
