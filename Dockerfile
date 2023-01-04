# Container image that runs your code
FROM amazon/aws-cli:2.0.6

COPY entrypoint.sh /entrypoint.sh
RUN chmod +X /entrypoint.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
CMD ["/entrypoint.sh"]
