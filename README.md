docker-ghost-ssl
================

### Requirements
* Docker
* SSL cert and key at data/certificates/server.crt and data/certificates/server.key
* If you want to import existing Ghost blog, put your Ghost data into data/ghostblog_data directory

### Build/Deploy Settings
* Edit config.sh

### Building images

    ./build.sh
    
  Running this will create two Docker images:
  * '***ghostblog***' image for ghost process. This runs with sqlite by default.
  * '***ghostblog_proxy***' image for nginx proxy. This is configured with SSL by default.

### Starting containers

    ./start_blog.sh
    
  Running this will start two containers:
  * '***ghostblog***' container with data/ghostblog_data as volume.
  * '***ghostblog_proxy***' container with ports 80/443 mapped to host, linked to 'ghostblog' container so nginx can get to Ghost container, and volumes data/certificates and data/sites-enabled mapped.
