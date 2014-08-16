#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM combro2k/nginx-proxy

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/etc/nginx/certificates", /etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Add files.
ADD start.bash /usr/local/bin/

# Define default command.
CMD ["bash", "start.bash"]

# Expose ports.
EXPOSE 80
EXPOSE 443