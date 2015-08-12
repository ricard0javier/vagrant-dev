FROM java:jdk

ENV spring.mail.password my-secret-pw
ENV spring.data.mongodb.host mongodb

ENV AWS_SECRET_ACCESS_KEY my-secret-pw
ENV AWS_ACCESS_KEY_ID my-secret-pw
ENV AWS_DEFAULT_REGION us-west-2

RUN mkdir -p /ricardovz/api \
	&& wget https://bootstrap.pypa.io/get-pip.py \
	&& python get-pip.py \
	&& pip install awscli

COPY conf /ricardovz/api/conf

VOLUME /ricardovz/api

EXPOSE 8080

ENTRYPOINT ["/ricardovz/api/conf/runme.sh"]
CMD ["bash"]