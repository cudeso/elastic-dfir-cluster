Import Kibana dashboard with
curl -X POST "<hostname>:5601/api/kibana/dashboards/import" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'
... paste here everything from loki-dashboard.json
'


