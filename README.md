Haskell class final project
============

Conway's Game of Life in Haskell

Takes a command-line argument specified input file specifying living cells (x,y) at initial state separated by newlines.

Example: in order to start with living cells at (0,0) and (2,3) the input file is:
<pre><code>0 0
2 3
</pre></code>

Awaits newline between each "step" of the world, and keeps track of number of steps performed.

To run on given input file:
<pre><code>runhaskell Life.hs input</pre></code>
