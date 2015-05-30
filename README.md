# Bowling Game
A ruby library to score bowling games.

## Usage


## Versions
### v0.1.0
- Single player
- Game rules:
  + 2 rolls in each frame
  + 10 pins in a frame
  + 10 frames in a match
- Score rules:
  + If in 2 rolls, the bowler fails to knock down all the pins, the score is the sum of the pins knocked down
  + If in 2 rolls, the bowler knocks down all the pins, it is a spare. The score is the sum the pins knocked down plus the number of pins knocked down in the next bowl.
  + If in 1 try, the bowler knocks down all the pins, it is a strike. The score is the sum of the pins knocked down plus the number of pins knocked down in the next two bowls.
  + In the last frame, if the bowler bowls a spare, they get another bowl. The score of this frame is the sum of the three bowls.
  + In the last frame, if the bowler bowls a strike, they get another 2 bowls. The score of this frame is the sum of the three bowls
  + If one has a strike for every roll, their score is 300
