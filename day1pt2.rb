lines = File.readlines("day1input.txt")

dial = 50
password = 0

lines.each do |line|
  puts(line)

  amount = line[1..-1].to_i
  if line.match(/R/)
    dial += amount
  else
    dial -= amount
  end

  times = dial.abs / 100

  if dial.negative?
    times += 1
  end

  password += times

  dial %= 100

  # if dial.zero?
  #   password += 1
  # end
  puts ("current password: " + password.to_s)
end

puts password

