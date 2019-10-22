# Queries related to competency questions 

[Gsheet](https://docs.google.com/spreadsheets/d/1KyhzI7aoNaKKv1pqSzwgbNKYVftlqYfxKQFksDmHYNw/edit#gid=0) with Questions

## What is the the list of all claims in tghe DBKF?

```sparql
PREFIX schema: <http://schema.org/>

select ?claim ?text ?author ?name ?created
where {
    ?claim a schema:Claim ;
           schema:text ?text .
    optional { 
        ?claim schema:author ?author .
        ?author schema:name ?name .
    }
    optional { ?claim schema:dateCreated ?created. }
} limit 100
```
## In which pieces of content does a claim appear?

```sparql
PREFIX schema: <http://schema.org/>
PREFIX wev: <http://weverify.eu/ontology/>

select ?appearance ?url ?author ?created
where { 
    bind(${claimUri} as ?claim)
    ?claim a schema:Claim ; schema:appearance ?appearance .
    ?appearance a wev:Appearance ;
                schema:url ?url .
    optional { ?appearance schema:author ?author . }
    optional { ?appearance schema:dateCreated ?created .  }
}
```
## What are the reviews of a given claim?

```sparql
PREFIX schema: <http://schema.org/>
PREFIX wev: <http://weverify.eu/ontology/>

select ?review ?text ?author ?name ?date ?url ?rating ?ratingBest ?ratingWorst
where { 
    bind(${claimUri} as ?claim)
    ?review a schema:ClaimReview ;
            schema:itemReviewed ?claim ;
            schema:reviewBody ?text ;
            schema:reviewRating ?rn .
    ?rn a wev:NormalizedRating ;
          schema:bestRating ?ratingBest ;
          schema:worstRating ?ratingWorst ;
          schema:ratingValue ?rating .
    optional { 
        ?review schema:author ?author .
        ?author schema:name ?name .
    }
    optional { ?review schema:datePublished ?date . }
    optional { ?review schema:sameAs ?url . }
} limit 100 
```

## What are the pieces of evidence of a given review? 

```sparql
PREFIX schema: <http://schema.org/>
PREFIX wev: <http://weverify.eu/ontology/>

select ?evidence ?subtype ?url
where { 
    bind(${reviewUri} as ?review)
    ?review a schema:ClaimReview ;
         schema:hasPart ?evidence .
    ?evidence a wev:SupportingEvidence ;
              schema:about ?eviItemUri .
    optional {?evidence schema:additionalType ?subtype . }
    ?eviItemUri schema:url ?url .
} limit 100 
```

