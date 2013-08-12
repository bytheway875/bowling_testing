bowling_testing
===============

Test-Driven-Development with RSpec on bowling scoring app.

Started with a failing test for each part of the scoring process

* Scoring a game with all gutter balls
* Scoring a game with strikes
* Scoring a game with spares
* Scoring a perfect score game (all strikes)

After all tests passed, I refactored the code into small, semantically named methods.

My biggest challenge here was in the refactoring process: 
I included the logic for "escaping" the scoring process when a game has more than 10 frames. (This only happens when there is a strike, and while there are >10 frames, the scoring actually takes place on the 10th frame, according to the score method's logic. When I returned @total_score inside the method roll, the scoring worked properly, but when I moved "return @total_score" into a method, it send me in to an infinite loop. Now I have the logic for dealing with frame > 10 in the right place so that the game scores properly.

