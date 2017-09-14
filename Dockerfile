FROM yanqd0/gitbook
RUN gitbook install
RUN gitbook serve
EXPOSE 4000 
