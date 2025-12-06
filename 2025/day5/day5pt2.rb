lines = File.readlines(File.join(__dir__, 'ranges.txt'), chomp: true)

answer = 0
iteration = 0

skip_set = Set.new


while true
  previous_size = skip_set.size

  (0..lines.length - 1).each do |i|
    next if skip_set.include?(i)

    current = lines[i].strip
    range = current.split('-')

    current_low = range[0].to_i
    current_high = range[1].to_i

    (i + 1..lines.length - 1).each do |j|
      next if skip_set.include?(j)

      compare = lines[j].strip
      compare_range = compare.split('-')

      compare_low = compare_range[0].to_i
      compare_high = compare_range[1].to_i

      if current_low >= compare_low && current_high <= compare_high
        skip_set.add(i)
        next
      elsif current_low <= compare_low && current_high >= compare_high
        skip_set.add(j)
        next
      elsif current_high >= compare_low && current_high <= compare_high
        skip_set.add(i)
        skip_set.add(j)
        lines.append("#{[current_low, compare_low].min.to_s}-#{compare_high.to_s}")
        next
      elsif current_low >= compare_low && current_low <= compare_high
        skip_set.add(i)
        skip_set.add(j)

        lines.append("#{compare_low.to_s}-#{[current_high, compare_high].max.to_s}")
        next
      end
    end
  end
  break if skip_set.size == previous_size
end



puts "skip_set"
puts skip_set
puts "skip_set"


File.open(File.join(__dir__, "new.txt"), "w") do |file|
  (0..lines.length - 1).each do |i|
    next if skip_set.include?(i)

    file << lines[i]
    file << "\n"
  end
end

lines = File.readlines(File.join(__dir__, 'new.txt'), chomp: true)

puts ("lines")

puts lines

puts ("lines")



lines.each do |line|
  puts 'line: ', line
  line = line.strip
  range = line.split('-')

  low = range[0].to_i
  high = range[1].to_i

  puts 'adding ' + (high - low + 1).to_s
  answer += (high - low + 1)

end

puts "Answer: ", answer.to_s
