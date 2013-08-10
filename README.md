bowling_testing
===============

Testing exercises with bowling kata

Created a bowling scoring app using bowling programming kata using test driven development best practices in rspec.

Started with a failing test for each part of the scoring process (scoring a game with all gutter balls, scoring a game with some spares,  a game with some strikes, and a game with all strikes), then developed methods to score the game correctly.

After all tests passed, I refactored the code into small methods that are semantically named.

My biggest challenge here was in the refactoring process: I included the logic for "escaping" the scoring process when a game has more than 10 frames. (This only happens when there is a strike, and while there are >10 frames, the scoring actually takes place on the 10th frame, according to the score method's logic. When I returned @total_score inside the method roll, the scoring worked properly, but when I moved "return @total_score" into a method, it send me in to an infinite loop. Now I have the logic for dealing with frame > 10 in the right place so that the game scores properly.
