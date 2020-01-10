#!/bin/bash

name=9814
url='http://localhost:9093/api/v1/alerts'

echo "firing up alert $name" 

echo "sending resolve"
curl -XPOST $url -d "[{ 
	\"status\": \"resolved\",
	\"labels\": {
		\"alertname\": \"$name\",
		\"service\": \"my-service\",
		\"severity\":\"warning\",
		\"instance\": \"$name.example.net\"
	},
	\"annotations\": {
		\"summary\": \"High latency is high!\"
	},
	\"generatorURL\": \"http://prometheus.int.example.net/<generating_expression>\"
}]"

echo ""
