FROM java:jdk

ENV spring.mail.password my-secret-pw

RUN mkdir -p /ricardovz/api

COPY conf /ricardovz/api/conf
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /ricardovz/api

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
