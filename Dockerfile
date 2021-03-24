FROM httpd:2.4.46

COPY ./index.html /usr/local/apache2/htdocs/
COPY ./card.png /usr/local/apache2/htdocs/

EXPOSE 80
