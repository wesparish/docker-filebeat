#!/bin/bash

docker build -t wesparish/filebeat:5.6.2-1.4 . && \
  docker push wesparish/filebeat:5.6.2-1.4 
