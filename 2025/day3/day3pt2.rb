lines = File.readlines(File.join(__dir__, 'day3input.txt'))
answer = 0
array = []

lines.each do |line|
  puts "line: ", line

  line = line.strip

  # digit = 0
  # digit_idx = -1
  digit_idx = -1

  (1..12).each do |j|
    digit = 0

    (digit_idx + 1..line.length - (12 - j) - 1).each do |i|
      next unless line[i].to_i > digit

      digit = line[i].to_i
      digit_idx = i
      break if line[i].to_i == 9
    end

    array[j - 1] = digit
  end


  battery = array.join
  battery = battery.to_i

  answer += battery
  puts "battery: " + battery.to_s
end

puts "answer: " + answer.to_s
