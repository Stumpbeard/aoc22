# frozen_string_literal: true

# Helper class for rock/paper/scissors
class TheirChoice
  ROCK_OUTCOMES = {
    'X' => 3,
    'Y' => 1,
    'Z' => 2
  }.freeze
  PAPER_OUTCOMES = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }.freeze
  SCISSOR_OUTCOMES = {
    'X' => 2,
    'Y' => 3,
    'Z' => 1
  }.freeze
  OUTCOMES = {
    'X' => 0,
    'Y' => 3,
    'Z' => 6
  }.freeze

  def initialize(choice)
    @choice = choice
  end

  def rock
    ROCK_VALUES[@choice]
  end

  def paper
    PAPER_VALUES[@choice]
  end

  def scissors
    SCISSOR_VALUES[@choice]
  end

  def bonus(you)
    case @choice
    when 'A'
      ROCK_OUTCOMES[you]
    when 'B'
      PAPER_OUTCOMES[you]
    when 'C'
      SCISSOR_OUTCOMES[you]
    end
  end

  def outcome(you)
    OUTCOMES[you]
  end
end

def determine_round(you, them)
  score = 0
  choice = TheirChoice.new(them)
  score += choice.outcome(you)
  score += choice.bonus(you)

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
