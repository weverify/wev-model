prefix bo:     <http://www.ontotext.com/business-object/>
prefix schema: <http://schema.org/>
prefix skos:   <http://www.w3.org/2004/02/skos/core#>
prefix wev:    <http://weverify.eu/ontology/>

clear graph <http://www.ontotext.com/business-object/computed-type>;

base <http://weverify.eu/resource/>
insert {
  graph <http://www.ontotext.com/business-object/computed-type> {
    ?x bo:type ?typename
  } 
} where {
  {
    values (?type ?typename) {
      (schema:Person           "Person")
      (schema:Organization     "Organization")
      (schema:ApplyAction      "Action")
      (schema:ActionStatusType "ActionStatusType")
    }
    ?x a ?type
  }
}
