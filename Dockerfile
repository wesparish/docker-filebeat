FROM docker.elastic.co/beats/filebeat:5.6.2

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

ENV LOG_FILE_PATHS="/host-var-log/*log,/host-var-log/*/*log" \
    LOGSTASH_HOSTS="logstash.weshouse:5001" \
    LOCATION="weshouse"

USER root

RUN curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod 0755 /usr/local/bin/jq

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["filebeat", "-e"]
