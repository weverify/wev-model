#!/usr/bin/env bash

curl "https://docs.google.com/spreadsheets/d/17Fmgow6BB0zkBXqk-sWEhoohOjo0bkpD2i4kqr-vjNg/gviz/tq?tqx=out:csv&sheet=Schemes" | tarql --stdin skos-schemas.tarql > rdf/skos-schemas.ttl

curl "https://docs.google.com/spreadsheets/d/17Fmgow6BB0zkBXqk-sWEhoohOjo0bkpD2i4kqr-vjNg/gviz/tq?tqx=out:csv&sheet=reviewType" | tarql --stdin skos-concepts.tarql > rdf/reviewTypes.ttl