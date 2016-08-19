# Based on https://github.com/danlynn/ember-cli/blob/1.13.1/Dockerfile


FROM node:0.12.7
MAINTAINER Dan Lynn <docker@danlynn.org>

# Note: npm is v2.12.1
RUN npm install -g ember-cli@0.1.15
RUN npm install -g bower@1.7.1

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

EXPOSE 4200 35729
WORKDIR /myapp

# run ember server on container start
ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["server"]
