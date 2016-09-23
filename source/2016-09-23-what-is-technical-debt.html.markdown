---
title: What is Technical Debt?
layout: post
date: 2016-09-23 04:57 UTC
tags: technical debt
---

Like many of us, for a long time, I was under the impression that technical debt equated to bad or unclean code. Recently, I learned the origin of the metaphor and the original intent of it.

Ward Cunningham is credited with coming up with the debt metaphor. He came up with the metaphor to describe the result of software written when the understanding of the application is not complete.

It seems that the idea that Ward was trying to convey is that software can be delivered more quickly, but it will be at the expense of the understanding of the application. This is understanding that would be used to build and design the system. Repayment of this debt are the refactorings that are necessary make new learnings of the application evident within the software. The consequence of not paying back this debt is a decrease in velocity.

What Ward is not talking about about was writing sloppy code. He even clarifies his stance on the metaphor shouldn't be used as an excuse for poorly written software.

Before coming across this original meaning of the debt metaphor, I took technical debt to describe *any* decisions made in the past that are causing pain today. This might have included sloppy code, or a lack of tests.

Even with this new insight, it is difficult for me to say that sloppy code or a lack of tests lives outside of the realm of the metaphor. I suppose the reason for this quibble is that they have the same effect on the velocity of development, albeit perhaps at at an increased interest rate. It fits right in with the metaphor.

On other hand, is there ever an excuse for sloppy code, and if so, should it exist inside a piece of software that is worthy of the debt metaphor?

---

Suggested Reading

* [Ward Explains the Debt Metaphor](http://c2.com/cgi/wiki?WardExplainsDebtMetaphor)
