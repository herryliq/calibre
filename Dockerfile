FROM fedora:23
MAINTAINER Bradley Leonard <bradley@stygianresearch.com> 

# install calibre cronie
RUN dnf -y install calibre-2.53.0

# create directories
#RUN mkdir /library & mkdir /addbooks & mkdir /scripts
RUN mkdir /data & mkdir /scripts

# add add-books.sh
ADD add-books.sh /scripts/add-books.sh
RUN chmod 755 /scripts/add-books.sh

# add the startup.sh
ADD startup.sh /scripts/startup.sh
RUN chmod 755 /scripts/startup.sh

# Expose port
EXPOSE 8080

CMD ["/scripts/startup.sh"]
