lines = File.readlines(File.join(__dir__, 'nums.txt'), chomp: true)

answer = 0

num_arr = []

lines.each do |line|
  line = line.strip
  puts 'line: ' + line
  line = line.split(' ')

  arr = []

  line.each do |num|
    arr.push(num)
  end

  num_arr.push(arr)
end

last_row = num_arr[num_arr.length - 1]

(0..num_arr[0].length - 1).each do |i|
  temp = num_arr[0][i].to_i

  puts "temp " + temp.to_s
  op = last_row[i]
  puts "op "+ op
  (1..num_arr.length - 2).each do |j|
    temp *= num_arr[j][i].to_i if op == '*'
    temp += num_arr[j][i].to_i if op == '+'
  end
  puts "adding temp ", temp.to_s
  answer += temp
end

puts answer



