---
title: "Serializing Objects to JSON in Python"
layout: post
categories: posts
tags: python, json, serialize
modified: 2016-01-09T20:25:00-05:00
date: 2015-03-08
---
I was recently working on a side project where I wanted to recursively serialize an object that contained a number objects stored in instance variables. While perusing Stack Overflow, I came across this [elegant solution](http://stackoverflow.com/a/15538391/1684563) posted by [Onur Yildirim](http://stackoverflow.com/users/112731/onur-yildirim), which I have altered slightly.

```python
import json

class SomeClass(object):
    def to_json(self):
        return json.dumps(self, default=vars
                          sort_keys=True, indent=4)
```

During my quest for said elegant solution, I found that many people have asked this same question on SO, and very few of the answers, even the _accepted_ ones, came close to being concise as the one above. This won't work in every situation, but it has proved to be a flexible solution for me thus far.
