lines = File.readlines(File.join(__dir__, 'day3input.txt'))
answer = 0

lines.each do |line|
  puts "line: ", line

  line = line.strip

  first_digit = 0
  max_idx = 0

  puts "line.length " + line.length.to_s

  (0..line.length - 2).each do |i|
    next unless line[i].to_i > first_digit

    first_digit = line[i].to_i
    max_idx = i
    break if line[i].to_i == 9
  end

  second_digit = 0
  (max_idx + 1..line.length - 1).each do |i|
    next unless line[i].to_i > second_digit

    second_digit = line[i].to_i
    break if line[i].to_i == 9
  end

  puts "first_digit: " + first_digit.to_s
  puts "second_digit: " + second_digit.to_s
  battery = first_digit.to_s + second_digit.to_s
  battery = battery.to_i

  answer += battery
  puts "battery: " + battery.to_s
end

puts "answer: " + answer.to_s
