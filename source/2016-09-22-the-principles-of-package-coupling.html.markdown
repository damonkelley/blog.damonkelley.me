---
title: The Principles of Package Coupling
layout: post
published: false
date: 2016-09-22 02:47 UTC
tags: Principles of Package Design, coupling, packages
---

<style>
img {
  display: block;
  margin: auto;
  padding-top: 1.3em;
  padding-bottom: 1.3em;
  height: auto;
  width: 100%;
  max-width: 35em;
}

img[alt*="cycle"] {
  width: 50%;
}
</style>


1. The Acyclic-Dependencies Principle
2. The Stable-Dependencies Principle
3. The Stable-Abstractions Principle


### The Acyclic-Dependencies Principle (ADP)

This principle states that the package dependency graph should be without cycles.

Why is it wise to avoid cycles in your dependency graph?

A package's dependencies are all of the packages that it depends on, and all of the packages that the dependencies depend on, and ...

In other words, a packages dependencies are transitive. Consider a package with the dependency graph below.

![no-cycle](2016-09-22-the-principles-of-package-coupling/no-cycle.svg)

Specifically, look at package `D`. If we decide to make a change to package `D`, then we will need to make sure that change is compatible with packages `E`, `F`, and `G`. These are all of that packages that transitively depend on `D`.

Now, consider the implication if a cycle is introduced where `G` depends on `A`.

![cycle](2016-09-22-the-principles-of-package-coupling/cycle.svg)


If we have to consider transitive dependencies, then this one additional dependency means that now *all the packages depend on all of the packages*.

In order to change `D` now, we much make sure that the change is compatible with `E`, `F`, `G`, `A`, `B`, and `C`. Then there is also the possibility that a change to `D` forces a change to `A`, which forces a different change in `D`. You can see the cycle here.

### The Stable-Dependencies Principle (SDP)

This principle states that one should _depend in the direction of the stability_.

Obviously, this principle is about stability. Though, what is stability, and how do we measure it?

Uncle Bob measures the stability of a package as the number of efferent couplings<sup>1</sup> divided by the sum of the number of efferent couplings and the number of afferent couplings<sup>2</sup>.

However, for simplicity's sake, we can illustrated this with two diagrams.

![stable instable](2016-09-22-the-principles-of-package-coupling/stable-instable.svg)

Both of the diagrams are stable or instable with respect to package `A`.

The diagram on the left demonstrates extreme instability. `A` depends on every other package, and is depended on by no packages. `A` is _dependent_. Any one of `A`'s dependencies could require a change in `A`.

The diagram on the right shows extreme stability. `A` depends on nothing, and everything else depends on it. Here, `A` is independent. Because `A` does not depend on anything, no other package could require it to change. On the flip side, because it is the dependee of three other packages, it has a reason to not change.

So how does this play into the direction of stability?

Basically, this principle says that you should put stable packages in the position of stability and instable packages in the position of instability. If there is a package that is going to have many changes, then it should be depended on by as few packages as possible. If a there is a package that will not change, then it can be depended on by many packages..

### The Stable-Abstractions Principle (SAP)

This principle states that _a package should be as abstract as it is stable_.

Another way of saying this is that a package to be depended on to the extent that they are abstract, and depend on others to the extent that it is concrete.

This suggests that that there are four extremes that a package can fall in to.

1. Not abstract & Stable
2. Abstract & Stable
3. Not Abstract & Instable
4. Abstract & Instable


Uncle Bob has a name for #1 and #4. He calls them the _Zone of Pain_ and the _Zone of Uselessness_ respectively. #1 means that a package is concrete, and depended on by many other packages. This is a package that would be very hard to change. #4 would be a package that is completely composed of abstractions, but no package is using those abstractions.

The sweet spot is somewhere between Abstract & Stable and Not abstract & Instable.

---
<sub>1. Efferent Couplings - </sub>

<sub>2. Afferent Couplings - </sub>
