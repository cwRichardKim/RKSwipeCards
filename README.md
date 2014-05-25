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

\#define ACTION_MARGIN 80 //%%% distance from center where the action applies. Higher = swipe further in order for the action to be called

\#define SCALE_STRENGTH 4 //%%% how quickly the card shrinks. Higher = slower shrinking

\#define SCALE_MAX .93 //%%% upper bar for how much the card shrinks. Higher = shrinks less

\#define ROTATION_MAX 1 //%%% the maximum rotation allowed in radians.  Higher = card can keep rotating longer

\#define ROTATION_STRENGTH 320 //%%% strength of rotation. Higher = weaker rotation

\#define ROTATION_ANGLE M_PI/8 //%%% Higher = stronger rotation angle

Each component is also explained thoroughly, so it is highly customizeable in many ways
