# frozen_string_literal: true

# Helper class for rock/paper/scissors
class YourChoice
  BONUS_VALUE = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }.freeze
  ROCK_VALUES = {
    'A' => 3,
    'B' => 0,
    'C' => 6
  }.freeze

  PAPER_VALUES = {
    'A' => 6,
    'B' => 3,
    'C' => 0
  }.freeze

  SCISSOR_VALUES = {
    'A' => 0,
    'B' => 6,
    'C' => 3
  }.freeze

  def initialize(choice)
    @choice = choice
  end

  def bonus
    BONUS_VALUE[@choice]
  end

  def rock(opponent)
    ROCK_VALUES[opponent]
  end

  def paper(opponent)
    PAPER_VALUES[opponent]
  end

  def scissors(opponent)
    SCISSOR_VALUES[opponent]
  end

  def wins(opponent)
    case @choice
    when 'X'
      rock(opponent)
    when 'Y'
      paper(opponent)
    when 'Z'
      scissors(opponent)
    end
  end
end

def determine_round(you, them)
  score = 0
  choice = YourChoice.new(you)
  score += choice.bonus
  score += choice.wins(them)

  score
end

file = File.open('input2')

score = 0
file.readlines.map(&:chomp).each do |line|
  next if line == ''

  opponent_choice = line[0]
  your_decision = line[2]

  score += determine_round(your_decision, opponent_choice)
end

print(score)

file.close
