# frozen_string_literal: true

file = File.open('input1')
elves = []

elf = 0
file.readlines.map(&:chomp).each do |line|
  if line == ''
    elves.push(elf)
    elf = 0
    next
  end

  elf += line.to_i
end

elves.sort!.reverse!
top3 = elves[0..2].sum
print(top3)

file.close
