As we discussed today here are the resources about the WeVerify project. 

* Data model and samples - https://github.com/weverify/wev-model/tree/master/examples
* GraphDB endpoint - http://weverify-gdb/sparql
* Lucid chart diagram - https://www.lucidchart.com/documents/edit/be9aaafd-ffe9-41cb-b5ec-bc7e0f75b541/ZYstk3~q0gIs

Thd GraphDB instance is deployed on an internal minikube, so if you want to access it, please add the following to your hosts file:
192.168.130.200 weverify-gdb

According to the model we have these main type of objects:

* Claim and its Appearance(s) in various media
* ClaimReview, with optional SupportingEvidence being CreativeWork(s) in various media
* Rating, with two concrete subclasses SourceRating vs NormalizedRating

The system will have two user roles - people who are able to write and everyone else. Multiple users will be able to write different appearances and reviews to one Claim. 

Requirements:

* Read from the database 
* Insert the mentioned types of objects 
* Update existing reviews and appearances 
* Delete 
* Validate

The users with write access should be able to delete/update only objects created by themselves. 
One of the most important feature is validation. Other systems will be able to insert claims, appearances and reviews in the database, so we need to be able to validate the input according to the scheme. 

Please discuss with the platform team what is possible and when and then we can organise a meeting. 

Andrey/Nikola, feel free to supplement anything I missed. 


