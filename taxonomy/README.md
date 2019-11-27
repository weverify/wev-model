# Taxonomy generation form google sheets 

## Prerequisites 

* [Tarql](http://tarql.github.io/) - converts tabular data to *RDF* following a pattern expresssed as *SPARQL* - it must be installed so that it's binary is added to the path 
* *riot* command line script form [Jena](https://jena.apache.org/index.html) installed and added to path 
* *curl* - to fetch csv data over http 
* *sed*  - for basic string manipulation 

## Google sheets to CSV

The following Google Sheets contain the source master data 
* [WEV Taxonomy](https://docs.google.com/spreadsheets/d/17Fmgow6BB0zkBXqk-sWEhoohOjo0bkpD2i4kqr-vjNg/edit#gid=0) Contains all used coded lists and links to the sheets with individual values 

We use the chart tools data source protocol to convert them to *CSV* and serve them over *HTTP*. 
The syntax is as follows:

`https://docs.google.com/spreadsheets/d/{{DOC_ID}}/gviz/tq?tqx=out:csv&gid={{SHEET_ID}}` where `DOC_ID` and `SHEET_ID` are both available form the sheet's url. For example the `reviewType`  [sheet](https://docs.google.com/spreadsheets/d/17Fmgow6BB0zkBXqk-sWEhoohOjo0bkpD2i4kqr-vjNg/edit#gid=952827375) has
 * `DOC_ID=17Fmgow6BB0zkBXqk-sWEhoohOjo0bkpD2i4kqr-vjNg` and 
 * `SHEET_ID=reviewType`

## Running a conversion 

[run.sh](run.sh) contains all the conversions. Each line generates one `.ttl` file in the [rdf](./rdf) folder. Notice that we can reuse [skos-concepts.tarql](skos-concepts.tarql) for different sheets corresponding to different thesaurii, provided the tables follow *exactly* the same format. 

After a conversion, riot collates all *.ttl* files form the [rdf/tmp](./rdf/tmp) folder and produces a single file called [wev-taxonomy.ttl](./rdf/wev-taxonomy.ttl) containing the entire taxonomy. Given that the volume is relatively small we can commit it to the repository. It can be visualized using any skos tool, such as for example [SKOS-Play!](http://labs.sparna.fr/skos-play/upload). 



