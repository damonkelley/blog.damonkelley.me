---
title: "Tic-Tac-Toe: The Beginning"
layout: post
published: false
date: 2016-06-16 03:31 UTC
tags: apprenticeship, java, tictactoe, tdd
---

As mentioned in the previous post, the first project as part of my apprenticeship is to implement an unbeatable game of Tic-Tac-Toe.

My assignment was laid out as follows:

1. I must strictly use TDD. Specifically, I am to adhere to Uncle Bob's [Three Rules of TDD](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd).
2. Use the [minimax](https://en.wikipedia.org/wiki/Minimax) algorithm to implement the unbeatable opponent.


---

Today, I finally started to make some headway on this project. This after I made one or two false starts. For me, getting started is always the hardest part. (See ["First Post"](https://blog.damonkelley.me/2016/06/13/first-post/))


At first I thought it might be a good idea to by test driving out the minimax code. Then I could have what I thought to be the most difficult bit of code out of the way. Perhaps I could write the rest of the game around that bit.

This turned out to be not the best approach. I am sure a programmer more seasoned with OO principles and TDD would have no problem tackling the problem from this angle.

My mentor, Colin, had some great advice. Instead of starting at a low level and building up the application, start at the application level and ease your way into the details. Thus instead of starting with an minimax implementation, and building a Tic-Tac-Toe game around it, I should start with a Tic-Tac-Toe game work my way down to the minimax implementation.

####So what would that look like?

Kent Beck outlined this approach when he described the "Starter Test" pattern in _Test-Driven-Development By Example_. His example is a socket-based server.

```console
StartServer
Socket= new Socket
Message= "hello"
Socket.write(message)
AssertEquals(message, socket.read)
```

When I adapted this for Tic-Tac-Toe, it looked somewhat similar

```java
String input = "0\n";
StringBuffer output = new StringBuffer();

Game game = new Game(input, output);
game.play();

String expected = " X |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n";
assertEquals(expected, output.toString());
```

Let me be clear. I don't consider this to be production quality code, but this test that outlines a very naive `Game` class ended up being a great starting point. After a few application level tests that looked similar the one above, I had a just enough scaffolding for me to jump down a level and start building out the behavior of the `Game` class and take the behavior of the larger application out of the foreground.

