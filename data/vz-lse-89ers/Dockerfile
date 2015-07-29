FROM debian:jessie

RUN apt-get update && apt-get install -y vim less

COPY conf /ricardovz/lse-89ers/conf

RUN mkdir -p /ricardovz/lse-89ers \
	&& tar -xvf /ricardovz/lse-89ers/conf/wordpress.tar -C /ricardovz/lse-89ers/ \
	&& rm /ricardovz/lse-89ers/conf/wordpress.tar

VOLUME /ricardovz/lse-89ers

CMD ["bash"]
