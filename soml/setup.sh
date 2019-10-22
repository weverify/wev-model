#!/bin/bash

docker-compose pull
docker-compose up &

sleep 30

# Load the data: this now happens with Turtle generated with TARQL in ../bootstrapping
curl -X POST \
     -H "Content-Type:application/trig" \
     -T statements.trig \
     http://localhost:9998/repositories/boaas/statements

# Compute SOML type
curl -X POST \
  -T soml-types.ru \
  -H "Accept: application/rdf+xml" \
  -H "Content-type: application/sparql-update" \
  http://localhost:9998/repositories/boaas/statements

# Load the Schema
curl -X POST -H "Content-Type: text/yaml" -H "Accept: application/ld+json" -T wev-model.yaml -H 'X-Request-ID: GettingStartedTx01' http://localhost:9995/boml
#curl -X POST -H "Content-Type: text/yaml" -H "Accept: application/ld+json" -T schema.yaml -H 'X-Request-ID: GettingStartedTx01' http://localhost:9995/boml

curl -X PUT -H 'X-Request-ID: BindingSchema' \
  http://localhost:9995/boml/weverify/boaas
