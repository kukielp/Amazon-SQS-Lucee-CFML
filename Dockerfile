FROM lucee/lucee:5.3-nginx

# NGINX configs
COPY config/nginx/ /etc/nginx/
# Lucee configs
COPY config/lucee/ /opt/lucee/web/
# Code
COPY demos/hello-world /var/www
# libs
COPY vendor /var/www/vendor