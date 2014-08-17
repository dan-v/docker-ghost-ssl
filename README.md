docker-ghost-ssl
================
This project builds and deploys two Docker containers, one for Ghost and the other for Nginx with SSL configured.

### Requirements
* Linux host with Git and Docker installed
* SSL cert and key

### Running blog

#### Clone repository 

    git clone https://github.com/dan-v/docker-ghost-ssl.git && cd docker-ghost-ssl

#### Import existing Ghost blog data (Optional) 
Put your Ghost data (contents directory) into data/ghostblog_data directory before starting containers

#### SSL Configuration
* Copy SSL cert to data/certificates/server.crt
* Copy SSL private key to data/certificates/server.key

#### Starting blog
Run the start script with your blog url like the example below. This will pull the latest images and start containers with appropriate port and volume mappings. If all goes well, your blog should be up and running.

    ./ghostblog_start.sh https://vittegleo.com
    
* Running this will start two containers:
    * ***ghostblog*** container with data/ghostblog_data mapped as a volume.
    * ***ghostblog_proxy*** container with ports 80/443 mapped to host, linked to 'ghostblog' container so nginx can proxy connections to Ghost container, and volumes data/certificates and data/sites-enabled mapped to /etc/nginx in container.

### (Optional) Building images

    ./build.sh
    
  Running this will create two Docker images:
  * ***9df8/ghostblog*** image for ghost blog.
  * ***9df8/ghostblog_proxy*** image for nginx proxy. 
