require 'bowling_game/game'

Given(/^the bowler rolls the ball in (.*) frames$/) do |frames|
  @frames = frames.split('>').map(&:strip)
end

When(/^the bowler checks the scores$/) do
  game = BowlingGame::Game.new
  game.roll @frames
  @score = game.score
end

Then(/^the score should be (\d+)$/) do |score|
  expect(@score).to eql(score.to_i)
end
