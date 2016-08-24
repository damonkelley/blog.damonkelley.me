---
title: Clients Own the Interface
layout: post
published: false
date: 2016-08-24 01:26 UTC
tags: DIP
---

<style>
img {
  display: block;
  margin: auto;
  padding-top: 1.3em;
  padding-bottom: 1.3em;
  height: auto;
  width: 100%;
  max-width: 30em;
}
</style>


I am currently reading through the "PPP"<sup>1</sup>, and as I was reading the chapter on the Dependency Inversion Principle, and even as I write this blog post, I am find myself having a much better understanding of the principle. This enlightment, if you will, stems from a simple idea: the client owns the interface.

For a long time, I did not understand DIP, and how it was important. Later, when I started doing a bit of Java, it started to make sense.

**Depend on abstractions!**

However, just as Uncle Bob points out in the book, this heuristic is a bit naive.

### Low level details

When we think about our tools to create abstractions, we often think those abstractions as owned by the concretetions.

We often think of the concretions as owning the interface that they implement. That ownership looks like this.

![naive ownership](2016-08-24-clients-own-the-interface/naive-ownership.svg)

This does not seem out of the ordinary. To me it seems perfectly normal. We have the concretion and the interface at the same abstraction level.

However, observe the nature of our dependencies when we introduce the client of the `Utility Layer` into the system.

![not inverted](2016-08-24-clients-own-the-interface/not-inverted.svg)


This reveals a flaw in the heuristic mentioned earlier. The parts of the system are depending on abstractions. That buffer between the different layer is present, and our software flexible becuase of it. However, this design the opposite of what DIP is meant to provide. In this system, the high level module is still depending on low level modules.


![inverted ownership](2016-08-24-clients-own-the-interface/inverted-ownership.svg)

---

<sup>1. _Agile Software Development, Principles, Practices, and Patterns_

* In a way this supports DIP
    * If the implementers own the interface, we would still be depending on lower level details

*
