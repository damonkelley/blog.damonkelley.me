---
title: "How Not to Kata: Part 2"
published: false
layout: post
date: 2016-06-20 04:12 UTC
tags: kata
---

In my most [recent post](https://blog.damonkelley.me/2016/06/17/how-not-to-kata/), I discussed some of the revelations I had about doing katas, but I failed to communicate the effectiveness of *performing* a kata.

So what is the benefit of performing a kata? (For an in depth, well formulated answer, go read [this post.](http://blog.8thlight.com/micah-martin/2013/05/28/performing-code-katas.html))

If you are performing a kata, then the kata needs to be prepared. You want want it to be rehearsed, with every step planned out ahead of time. One might argue that a well executed kata is not the most engaging piece of entertainment, so you could imagine how dull it would be to watch someone struggle through an off by one error during a kata performance.

A lot can be gained from preparing a kata in this way. Maybe there is a some language feature that you are not very familiar with, but it fits nicely into the kata. Or perhaps there is some editor function that is very useful at a certain moment in the kata. By preparing a kata, you can internalize that editor function or language feature, and turn it into a part of your vocabulary.

### Preparing prime factors

#### JUnit Parameterized Tests

This is exactly what happened for me. While I was preparing the prime factors kata, I noticed that my tests were starting to look very duplicative. Something along the lines of

```java
@Test
public twoIsItsOwnFactor() {
    assertEquals(Arrays.asList(2), PrimeFactors.of(2));
}

@Test
public threeIsItsOwnFactor() {
    assertEquals(Arrays.asList(3), PrimeFactors.of(3));
}

@Test
public fourFactorsToTwoAndTwo() {
    assertEquals(Arrays.asList(2, 2), PrimeFactors.of(4));
}
```

Each test was basically the same, but I am sending in different input, and expecting a different output. The [parameterization feature of JUnit](https://github.com/junit-team/junit4/wiki/Parameterized-tests) is excellent at handling this sort of testing, but there is quite a bit of boilerplate that is involved to get it working. I don't tend to reach for parameterization extremely often, so with it would take me quite a few times to remember how to set up a test for parameterization.

Fortunately, because I rehearsed the kata repeatedly, I was able to internalize most of the setup, so the next time I need it, I will already be quite familiar with how to set it up.

#### Vim Regex

At one point in the kata, I needed to convert all of the integer literals inside of the test class to long literals<sup>1</sup>. I knew that the Vim search & replace mechanism would work great here, but I have always had trouble remembering the regex flavor specific to Vim.

<sup>1.</sup><sub>Since I was TDDing the kata, I did not introduce longs until I had reached a point in my testing when they were necessary.</sub>

The command I used was

```
:'<'>s/\d\+/\0L/g
```

It is fairly simple. Find all words that are compose of only digits and append an `L` to it. The `\0` in the replacement pattern drops in the matching text from the search pattern.

So what I ended up picking up was the `\0` special character in the substitution command. Another tool for the tool belt!


### Conclusion

Write a conclusion (maybe?)
