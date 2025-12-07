require 'set'
lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

answer = 0
start = lines[0].index('S')
beams = [start]

new_beams = Set.new
counting_beams = Array.new(lines[0].length, 0)

(2..lines.length - 2).each do |i|
  next if i % 2 != 0

  puts 'i: ', i.to_s

  beams = i == 2 ? beams : new_beams

  puts 'beams: '
  puts beams

  puts 'beams^ '

  new_beams = Set.new

  new_counting_beams = Array.new(lines[0].length, 0)

  beams.each do |beam|
    current_count = counting_beams[beam] == 0 ? 1 : counting_beams[beam]
    new_beams.add(beam) if lines[i][beam] == '.'

    new_counting_beams[beam] += 1 * current_count if lines[i][beam] == '.'
    next unless lines[i][beam] == '^'

    new_beams.add( beam - 1) if beam - 1 >= 0
    new_counting_beams[beam - 1] += 1 * current_count if beam - 1 >= 0
    new_beams.add( beam + 1) if beam + 1 <= lines[i].length - 1
    new_counting_beams[beam + 1] += 1 * current_count if beam + 1 <= lines[i].length - 1

  end

  counting_beams = new_counting_beams
end

answer = counting_beams.sum
puts answer

