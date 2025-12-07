lines = File.readlines(File.join(__dir__, 'nums.txt'), chomp: true)

answer = 0

ops_arr = []

lines.each do |line|
  line = line.strip
  # puts 'line: ' + line
  line = line.split(' ')

  arr = []

  line.each do |num|
    arr.push(num)
  end

  ops_arr.push(arr)
end

max_lengths = []
(0..ops_arr[0].length - 1).each do |i|
  max_len = 0
  (0..ops_arr.length - 2).each do |j|
    current = ops_arr[j][i]

    max_len = [max_len,current.length].max

  end
  max_lengths.push(max_len)
end


## process again

lines = File.readlines(File.join(__dir__, 'nums.txt'), chomp: true)
num_arr = []
lines.each do |line|
  puts 'line: ' + line

  arr = []

  curr_idx = 0
  max_lengths.each do |length|
    number = ''
    (0..length - 1).each do |character|
      if curr_idx + character <= line.length - 1
        number << line[curr_idx + character]
      else
        number << ' '
      end
    end
    curr_idx += length + 1
    arr.push(number)
  end

  num_arr.push(arr)
end

# # puts "num_arr"
# puts num_arr

last_row = ops_arr[ops_arr.length - 1]



(0..num_arr[0].length - 1).each do |i|
  temp_array = Array.new(4)
  (0..num_arr.length - 2).each do |j|
    current = num_arr[j][i]
    (0..current.length - 1).each do |k|
      next if current[k] == ' '
      idx = 4 - 1 - k
      temp_array[idx] ||= ""
      temp_array[idx] << current[k]
    end
  end

  puts temp_array

  op = last_row[i]

  temp_ans = 0 if op == "+"
  temp_ans = 1 if op == "*"

  temp_array.each do |num|
    next if num.nil?

    temp_ans += num.to_i if op == "+"
    temp_ans *= num.to_i if op == "*"
  end

  answer += temp_ans

end

puts answer



