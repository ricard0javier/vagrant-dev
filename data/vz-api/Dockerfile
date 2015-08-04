FROM java:jdk

ENV spring.mail.password my-secret-pw
ENV spring.data.mongodb.host mongodb

RUN mkdir -p /ricardovz/api

RUN mkdir -p /ricardovz/api/ricardovz-api \
	git clone https://github.com/ricard0javier/ricardovz /ricardovz/api/ricardovz-api \
	cd /ricardovz/api/ricardovz-api \
	./gradlew distTar \
	mv build/distributions/ricardovz-api.tar /ricardovz/ricardovz-api.tar \
	rm -R /ricardovz/api

RUN cd /ricardovz/api/ \
	mv /ricardovz/ricardovz-api.tar /ricardovz/api/ricardovz-api.tar \
	tar -xvf ricardovz-api.tar \
	rm ricardovz-api.tar

COPY conf /ricardovz/api/conf

VOLUME /ricardovz/api

EXPOSE 80
EXPOSE 8080
EXPOSE 443

ENTRYPOINT ["/ricardovz/api/ricardovz-api/bin/ricardovz-api"]
CMD ["bash"]
