FROM avastsoftware/pinto

MAINTAINER Avast Viruslab Systems

RUN apt-get install -y make cpanminus

COPY cpanfile /tmp/cpanfile
RUN cpanm --installdeps /tmp

COPY pinto_uploader /usr/bin/pinto_uploader

VOLUME ["/var/lib/pinto"]

ENTRYPOINT ["hypnotoad"]
CMD ["-f", "/usr/bin/pinto_uploader"]

EXPOSE 8080
