FROM yanqd0/gitbook
COPY . /srv/gitbook
RUN gitbook install
ENTRYPOINT gitbook serve
EXPOSE 4000 
