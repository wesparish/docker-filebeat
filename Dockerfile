FROM docker.elastic.co/beats/filebeat:5.6.2

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

ENV LOG_FILE_PATHS="/host-var-log/*log,/host-var-log/*/*log,/containers/*/*log" \
    LOGSTASH_HOSTS="logstash:5044"   

USER root

RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
