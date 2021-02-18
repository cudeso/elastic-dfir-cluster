# elastic-dfir-cluster
Elastic cluster for DFIR

See https://www.vanimpe.eu/2020/10/24/analyse-linux-syslog-auditd-logs-with-elastic/

## Init

Make sure you have Docker and Docker-compose installed.

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
```

Initiliaze via `init-elastic-dfir.sh`

Start containers via `start-elastic-dfir.sh`

Elastic requires that you have set `vm.max_map_count` sufficiently high. Check /etc/sysctl.conf. A good value is 262144


## Import logs

Change the config in `filebeat/filebeat.docker.yml`

Start the filebeat docker as in `filebeat-dfir.txt`

Do not forget to import the dashboards and vizualisations.

## Create -beat dashboards and visualisations

`packetbeat setup -e   -E output.logstash.enabled=false   -E output.elasticsearch.hosts=['ELK:9200']   -E output.elasticsearch.username=packetbeat_internal   -E output.elasticsearch.password=YOUR_PASSWORD   -E setup.kibana.host=ELK:5601`

`filebeat setup -e   -E output.logstash.enabled=false   -E output.elasticsearch.hosts=['ELK:9200']   -E output.elasticsearch.username=filebeat_internal   -E output.elasticsearch.password=YOUR_PASSWORD   -E setup.kibana.host=ELK:5601`

## NGINX and Cacti

The `docker-compose.yml-with-nginx_cacti` contains the settings to run NGINX as a reverse proxy in front of Elastic. The reverse proxy runs on port 8443 and uses locally (outside Docker) installed certificates from Let's Encrypt. The reverse proxy maps Elastic and Cacti to two Docker containers.

In the NGINX configuration, change the hostname, certificate information file and the htpassword file.
