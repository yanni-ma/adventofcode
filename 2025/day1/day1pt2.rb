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

  if dial.negative? && (dial + amount.abs != 0)
    times += 1
  end

  password += times

  if dial.zero?
    password += 1
  end

  dial %= 100

  puts ("current password: " + password.to_s)
end

puts password

