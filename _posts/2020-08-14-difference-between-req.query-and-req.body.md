---
layout:         post
title:          Difference between req.query and req.body
date:           2020-08-14 00:29:28 +0200
categories:     [tech]
tags:           [Node.js]
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

[Reference: stack overflow anser](https://stackoverflow.com/questions/30915424/express-what-is-the-difference-between-req-query-and-req-body)

[req.query](http://expressjs.com/en/4x/api.html#req.query) contains the query params of the request.

For example in ` sample.com?foo=bar` , ` req.query` would be ` {foo:"bar"}` 

[req.body](http://expressjs.com/en/4x/api.html#req.body) contains anything in the request body. Typically this is used on `PUT` and ` POST` requests.

For example a ` POST` to sample.com with the body of ` {"foo":"bar"}`  and a header of type ` application/json`, ` req.body` would contain ` {foo: "bar"}`

Or we can just remember this: ` query` for GET, ` body` for POST and PUT.

