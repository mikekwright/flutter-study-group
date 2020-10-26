State Design Pattern
===========================================

This project demonstrates the state design pattern being implemented using
interfaces and class implementations.  It is a simple example that it used
to demonstrate the power of the state pattern.

Problem Story
---------------

For this problem we are going to demonstrate the creation of a music player.
This player will support a few different modes: playlist play, playlist pause,
random play and random pause. There are also the standard operations: play,
pause, next, previous.

### States

* `playlist play` can go to `playlist pause` or `random play`
* `playlist pause` can go to `playlist play` or `random play`
* `random play` can go to `randomm pause` or `playlist play`
* `random pause` can go to `random play` or `playlist play`
