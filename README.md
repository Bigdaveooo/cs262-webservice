# cs262-webservice
monopoly service repo, working

a.  cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net
    cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net/players
    cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net/players/1
    cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net/players/-1
    cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net/blob
    cs262webapp-dab37-dygqgfg0cheqfjay.eastus2-01.azurewebsites.net/games

b.  /players is idempotent and nullipotent for GET, none for POST
    /players/1 is idempotent and nullipotent for GET, idempotent for PUT and DELETE
    /player/-1 is idempotent and nullipotent for GET, idempotent for PUT and DELETE
    /blob is idempotent and nullipotent for GET
    /games is idempotent and nullipotent for GET

c.  yes, the service appears to be restful due to it useing standard HTTP methods, it uses JSON, and it supports CRUD with idempotent and nullipotent operations

d.  potentially there could be an impedence mismatch since my monopoly game is in sql format instead of json, and my web app displays my data in json format not sql query format like when i test locally straight from my database