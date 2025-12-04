# frozen_string_literal: true
answer = 0

iteration = 0

while true
  previous_answer = answer

  filename = iteration.zero? ? "input" : (iteration - 1)
  lines = File.readlines(File.join(__dir__, "#{filename}.txt"), chomp: true)

  File.open(File.join(__dir__, "#{iteration}.txt"), "w") do |file|
    (0..lines.length - 1).each do |i|
      line = lines[i]
      puts 'line: ', lines[i]
      line = line.strip

      (0..line.length - 1).each do |char|
        if line[char] != '@'
          file << line[char]
          next
        end
        # next unless line[char] == '@'

        adjacent_count = 0
        (0..7).each do |position|
          case position
          when 0
            line_num = i
            char_num = char + 1
          when 1
            line_num = i + 1
            char_num = char + 1
          when 2
            line_num = i + 1
            char_num = char
          when 3
            line_num = i + 1
            char_num = char - 1
          when 4
            line_num = i
            char_num = char - 1
          when 5
            line_num = i - 1
            char_num = char - 1
          when 6
            line_num = i - 1
            char_num = char
          when 7
            line_num = i - 1
            char_num = char + 1
          else
            next
          end

          next if line_num.negative? or line_num > lines.length - 1
          next if char_num.negative? or char_num > line.length - 1

          checking_line = lines[line_num]
          adjacent_char = checking_line[char_num]

          adjacent_count += 1 if adjacent_char == '@'
        end

        answer += 1 if adjacent_count < 4
        file << '.' if adjacent_count < 4
        file << '@' if adjacent_count >= 4
      end

      file << "\n"
    end

  end

  iteration += 1

  break if answer == previous_answer
end



puts answer

