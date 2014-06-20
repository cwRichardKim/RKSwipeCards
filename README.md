TinderSimpleSwipeCards
======================

The basics of a Tinder-like swipeable cards interface influenced by http://guti.in/articles/creating-tinder-like-animations/

This is meant to be taken and built off of, not as a simple drag and drop solution

Demo:
![alt tag](http://i.imgur.com/NwsgUcr.gif)

Features:
* Swipe cards left or right to call two separate actions
* Have multiple cards on screen depending on the number of items in an array
* Extremely simple, every component is explained
* Very easily customizeable


Customizeability:

in DraggableView.h

* ACTION_MARGIN: distance from center where the action applies. Higher = swipe further in order for the action to be called
* SCALE_STRENGTH: how quickly the card shrinks. Higher = slower shrinking
* SCALE_MAX: upper bar for how much the card shrinks. Higher = shrinks less
* ROTATION_MAX: the maximum rotation allowed in radians.  Higher = card can keep rotating longer
* ROTATION_STRENGTH: strength of rotation. Higher = weaker rotation
* ROTATION_ANGLE: Higher = stronger rotation angle

Each component is also explained thoroughly, so it is highly customizeable in many ways
