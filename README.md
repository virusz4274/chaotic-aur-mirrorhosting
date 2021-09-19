# chaotic-aur-mirrorhosting

This contains the docker compose file to deploy a chaotic-aur (aur.chaotic.cx ) mirror
You dont need to have port forwarding working to deploy this mirror.

## Inside the Docker Compose

* Syncthing container
* Nginx Server
* Cloudflared

Syncthing is used to sync the mirror.
Nginx server will be serving the files inside the Syncthing folder.
Cloudflared will create a tunnel between Nginx Server and Cloudflare Edge computers making it accesible to the public.

## Prerequisite 

* Have domain DNS managed on cloudflare
* Docker and Docker compose installed
* About 80GB of storage space

## For People using ARM64 or RaspberryPi 

* RUN ```docker build -t cloudflaredarm64 .```
* change the image of cloudflared container to cloudflaredarm64 in the docker-compose.yml file

## Instruction

1) Clone this repo 
2) Get tokens for cloudflare
   * If you own domain, follow [this Guide](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide)
     You can generate a credentials from your local pc and transfer it to the cloudflared folder.
   * If you dont have a domain get a tunnel key and config from us.
3) Edit the config.yml inside cloudflared folder 
4) Run docker-compose up -d 
5) change folder ownership
    * ```cd srv/http/repos/```
    * ```sudo chown $USER:$USER -R chaotic-aur/```
6) Open syncthing web interface by visting (http://localhost:8384)
    * Add device: ZDHVMSP-EW4TMWX-DBH2W4P-HV5A6OY-BBEFABO-QTENANJ-RJ6GKNX-6KCG7QY, then check "Introducer" and "Auto accept"
    * Select Add Folder
    * Enter jhcrt-m2dra in Folder ID
    * Enter chaotic-aur in Folder Label
    * Add folder with "Ignore Permissions" and "Pull Order" by "Oldest First".
    * Wait for chaotic-aur to accept it!
