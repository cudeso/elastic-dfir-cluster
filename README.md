# elastic-dfir-cluster
Elastic cluster for DFIR

See https://www.vanimpe.eu/2020/10/24/analyse-linux-syslog-auditd-logs-with-elastic/

## Init

Make sure you have Docker and Docker-compose installed.

Initiliaze via `init-elastic-dfir.sh`

Start containers via `start-elastic-dfir.sh`

Elastic requires that you have set `vm.max_map_count` sufficiently high. Check /etc/sysctl.conf. A good value is 262144


## Import logs

Change the config in `filebeat/filebeat.docker.yml`

Start the filebeat docker as in `filebeat-dfir.txt`

Do not forget to import the dashboards and vizualisations.
