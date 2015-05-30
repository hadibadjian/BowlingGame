Feature:
  In order to proceed with the game
  A bowler
  should be able to get correct scores

  Scenario Outline: Multiple rolls
    Given the bowler rolls the ball in <frames> frames
    When the bowler checks the scores
    Then the score should be <score>

    Examples:
    | frames    | score |
    | 4,4       | 8     |
    | 5,4 > 10  | 9     |
    | 4,6 > 5,0 | 20    |
    | 10 > 5,4                                             | 28    |
    | 10 > 5,4 > 10 > 5,0                                  | 48    |
    | 10 > 5,4 > 10 > 10 > 10 > 10 > 10 > 9,0              | 175   |
    | 10 > 5,5 > 7,1 > 10 > 10 > 10 > 6,2 > 9,1 > 10 > 9,0 | 175   |
