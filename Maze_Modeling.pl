% Verifying if two Cases C1 and C2 can constitute the two Nodes
% of a valid Edge modeling the Maze
isEdge((X1, Y1), (X2,Y2), (Dimension_X, Dimension_Y)):-
  and(X1 > 0, X2  > 0),
  and(Y1  > 0, Y2 > 0),
  and(X1  =< Dimension_X, X2  =< Dimension_X),
  and(Y1  =< Dimension_Y, Y2  =< Dimension_Y),
  % A wall cannot constitute a node for an Edge
  \+  wall((X1, Y1)),
  \+  wall((X2, Y2)).

% Generating the possible Children of Node in a Maze
child((X,Y), (Xc, Yc)):-
     X2m is X-1,
     Y2m is Y-1,
     X2p is X+1,
     Y2p is Y+1,
     % Top case
     (isEdge((X, Y), (X, Y2p), (6, 6)), Xc is X, Yc is Y2p), !,
     % Top-Right case
     (isEdge((X, Y), (X2p, Y2p), (6, 6)), Xc is X2p, Yc is Y2p), y
     .
% Definition of an Edge from two given Nodes within a Maze,  with the Dimension (X, Y) 
% of the latter given.
edge_def((X1, Y1),(X2, Y2), (Dimension_X, Dimension_Y)):-
  % None of the two Nodes can be a Wall
  and(\+ wall((X1, Y1)), \+ wall((X2, Y2))),
  % Eight different cases might happen
  (
     % case 1
     and(and(X2m = X1, Y2m = Y1), and(X2m > 0, Y2m > 0));
     % case 2
     and(and(X2m = X1, Y2 = Y1), (X2m > 0));
     % case 3
     and(and(X2m = X1, Y2p = Y1), and(X2m > 0, Y2p =< Dimension_Y));
     % case 4
     and(and(X2 = X1, Y2m = Y1), Y2m  > 0);
     % case 5
     and(and(X2p = X1, Y2p = Y1), and(X2p =< Dimension_X, Y2p =< Dimension_Y));
     % case 6
     and(and(X2p = X1, Y2 = Y1), X2p =< Dimension_X);
     % case 7
     and(and(X2p = X1, Y2m = Y1), and(X2p =< Dimension_X, Y2m > 0));
     % case 8
     and(and(X2 = X1, Y2p = Y1), Y2p =< Dimension_Y)
 ),
  X2m is X2-1,
  Y2m is Y2-1,
  X2p is X2+1,
  Y2p is Y2+1
 .
