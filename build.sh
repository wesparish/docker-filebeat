#!/bin/bash

docker build -t wesparish/filebeat:5.6.2 . && \
  docker tag wesparish/filebeat:5.6.2 wesparish/filebeat:latest && \
  docker push wesparish/filebeat:5.6.2 && \
  docker push wesparish/filebeat:latest
