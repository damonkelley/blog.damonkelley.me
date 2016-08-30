---
title: Refactoring Clojure functions with Multimethods
laytout: post
published: false
date: 2016-08-30 04:10 UTC
tags: clojure, refactoring, multimethods
---

In the past few weeks, there have been multiple times where I have been in the situation where I wanted to modify the data that a function operates on.

Most recently, I was working a router to route HTTP requests, and I wanted to change the structure of the routes from a vector of vectors

```clojure
(def routes [["GET" "/" handlers/index]
             ["POST" "/" handlers/create]
             ["GET" "/log" handlers/log]])
```

to a vector of maps

```clojure
(def routes [{:path "/" :handlers {"GET" handlers/index
                                   "POST" handlers/create}}
             {:path "/log" :handlers {"GET" handlers/log}}])
```

These data structures are intended to be passed to a function called `route`. With a little help from multimethods, I was able to refactor `route` to accept either versions of `routes`, and later only the latter version of `routes`.

For simplicity's sake, let's look at the `sum` function.

```clojure
(defn sum [nums]
  (apply + nums))
```

We use this function in a few different places in our application.

After our app starts to grow more and more, it becomes clear that `sum` needs to operate on a list of strings instead of a list of integers. *Once we make this change, everything will get easier*<sup>1</sup>.

There is one problem, don't want to break all of the clients of `sum` that are still just passing two numbers.

We can use multimethods to start building an alternate version of `sum`.

First we run the tests.

```console
..
2 passed 0 failed 0 error
```

These two tests are the tests we have already written for `sum`

We know that `sum` is working, let's convert it into a multi-method that has a single method defined.

```clojure
(defmulti sum
  (fn [args] (type (first args))))

(defmethod sum java.lang.Long
  [nums]
  (apply + nums))
```

The tests still pass.

```console
..
2 passed 0 failed 0 error
```

Now we can start test driving the new and improved version that operates on list of strings.

After a while we have our new method

```clojure
(defmulti sum
  (fn [args] (type (first args))))

(defmethod sum java.lang.Long
  [nums]
  (apply + nums))

(defmethod sum String
  [strings]
  (->> strings
    (map #(Integer/parseInt %))
    (apply +)
    .toString))
```

```console
.....
5 passed 0 failed 0 error
```

Awesome. The new version of our function is ready. We can migrate each client of `sum` to use the new version of while keeping our tests passing.

Eventually, none of the clients are using the old version of `sum` and we can remove it. Now we are left with only the new version.

```clojure
(defn sum [strings]
  (->> strings
    (map #(Integer/parseInt %))
    (apply +)
    .toString))
```

```console
.....
3 passed 0 failed 0 error
```

### Conclusion

Obviously, this is a silly example that I cooked up. I can't think of a good reason why we would choose a list of strings over a list of numbers. However, it demonstrates how we can use multimethods to provide multiple implementations during a refactoring. We want to keep the function. The naming is accurate, it is used in the all right places, we just want to alter what we send through it. We can use multimethods as bridge from the old implementation to the new implementation.
