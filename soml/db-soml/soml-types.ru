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
      (schema:Place            "Place")
      (schema:Claim            "Claim")
      (wev:Appearance          "Appearance")
      (schema:ClaimReview      "ClaimReview")
      (wev:SupportingEvidence  "SupportingEvidence")
      (schema:CreativeWork     "CreativeWork")
      (wev:SourceRating        "SourceRating")
      (wev:NormalizedRating    "NormalizedRating")
      (skos:ConceptScheme      "ConceptScheme")
    }
    ?x a ?type
  } union {
    values (?scheme ?typename) {
      (<strategy>              "MisleadershipStrategy")
      (<reviewType>            "ReviewType")
      (<evidence>              "EvidenceType")
    }
    ?x skos:inScheme ?scheme
  }
}
