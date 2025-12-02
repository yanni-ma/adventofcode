lines = File.read(File.join(__dir__, 'day2input.csv'))
            .split(',')

answer = 0

lines.each do |line|
  puts "line: ", line
  range = line.split('-')

  low = range[0].to_i
  high = range[1].to_i

  (low..high).each do |i|
    i = i.to_s

    next if i.length.odd?

    first_half = i[0..i.length/2 - 1]
    second_half = i[i.length/2..i.length]

    if first_half == second_half
      answer += i.to_i
    end
  end

end


puts "answer::", answer
