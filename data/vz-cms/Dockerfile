FROM debian:jessie

RUN apt-get update && apt-get install -y vim less curl

ENV WORDPRESS_VERSION 4.2.2
ENV WORDPRESS_UPSTREAM_VERSION 4.2.2
ENV WORDPRESS_SHA1 d3a70d0f116e6afea5b850f793a81a97d2115039

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_UPSTREAM_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& mkdir -p /ricardovz/cms \
	&& tar -xzf wordpress.tar.gz -C /ricardovz/cms/ \
	&& rm wordpress.tar.gz

COPY conf /ricardovz/cms/conf

VOLUME /ricardovz/cms

CMD ["bash"]
