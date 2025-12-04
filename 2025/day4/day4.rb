lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)
answer = 0

(0..lines.length - 1).each do |i|
  line = lines[i]
  puts 'line: ', lines[i]
  line = line.strip
  
  (0..line.length - 1).each do |char|
    next unless line[char] == '@'

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

      next if line_num < 0 or line_num > lines.length - 1
      next if char_num < 0 or char_num > line.length - 1

      checking_line = lines[line_num]
      adjacent_char = checking_line[char_num]

      adjacent_count += 1 if adjacent_char == '@'
    end

    answer += 1 if adjacent_count < 4
  end
end

  puts answer

