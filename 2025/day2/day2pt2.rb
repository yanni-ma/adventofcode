lines = File.read(File.join(__dir__, 'day2input.csv'))
            .split(',')

answer = 0

lines.each do |line|
  range = line.split('-')

  low = range[0].to_i
  high = range[1].to_i

  (low..high).each do |i|
    i = i.to_s
    (2..i.length).each do |j|
      next if i.length % j != 0

      segment_length = i.length/j
      first_section = i[0..i.length/j - 1]

      next_section_lower_bound = segment_length

      match_found = true

      while next_section_lower_bound < i.length
        next_section = i[next_section_lower_bound, segment_length]

        next_section_lower_bound += segment_length

        if first_section != next_section
          match_found = false
          break
        end
      end

      answer += i.to_i if match_found

      break if match_found
    end
  end
end


puts "answer::", answer
