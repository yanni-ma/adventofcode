require 'set'
lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

answer = 0
start = lines[0].index('S')
beams = [start]

new_beams = Set.new

(2..lines.length - 2).each do |i|
  next if i % 2 != 0

  puts 'i: ', i.to_s

  

  beams = i == 2 ? beams : new_beams

  puts 'beams: '
  puts beams

  puts 'beams^ '

  new_beams = Set.new

  beams.each do |beam|
    new_beams.add(beam) if lines[i][beam] == '.'
    next unless lines[i][beam] == '^'

    answer += 1
    new_beams.add( beam - 1) if beam - 1 >= 0
    new_beams.add( beam + 1) if beam + 1 <= lines[i].length - 1
  end
end

puts answer

