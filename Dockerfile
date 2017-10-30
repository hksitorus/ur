# https://github.com/phusion/baseimage-docker
FROM hksitorus/predictionio:latest
MAINTAINER harry.kurniawan@bridestory.com

# copying dependencies
RUN mkdir -p /root/.m2/repository
ADD files/repo /root/.m2/repository

# clone ur
RUN mkdir -p /ur && cd /ur && git clone https://github.com/hksitorus/universal-recommender vendor && \
    cd /ur/vendor && git checkout 0.7.0-SNAPSHOT

ADD files/engine-vendor.json /ur/vendor/engine.json
#RUN cd /ur/vendor/ && pio build --verbose

# clean up apt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/cache/oracle-jdk8-installer

CMD ["bash"]