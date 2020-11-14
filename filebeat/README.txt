Choose one of two files to be present.

filebeat.docker.yml sends directly to Elastic
filebeat-loki.docker.yml sends via Logstash

Be aware of the error
    Exiting: error loading config file: config file ("filebeat.yml") can only be writable by the owner but the permissions are "-rw-rw-r--" (to fix the permissions use: 'chmod go-w /usr/share/filebeat/filebeat.yml')
If this happens, then set proper file permissions (go-w)