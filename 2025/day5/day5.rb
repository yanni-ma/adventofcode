# require 'set'
#
# lines = File.readlines(File.join(__dir__, 'ranges.txt'), chomp: true)
# answer = 0
#
# possible_set = Set.new
#
# lines.each do |line|
#   puts 'line: ', line
#   line = line.strip
#   range = line.split('-')
#
#   low = range[0].to_i
#   high = range[1].to_i
#
#   (low..high).each do |i|
#     possible_set.add(i)
#   end
# end
#
# ingredients = File.readlines(File.join(__dir__, 'ingredients.txt'), chomp: true)
#
# ingredients.each do |ingredient|
#   puts 'ingredient: ', ingredient
#
#   ingredient = ingredient.strip
#   ingredient = ingredient.to_i
#
#   answer += 1 if possible_set.include?(ingredient)
# end
#
# puts 'answer: ' + answer
#


require 'set'

lines = File.readlines(File.join(__dir__, 'ranges.txt'), chomp: true)
ingredients = File.readlines(File.join(__dir__, 'ingredients.txt'), chomp: true)
answer = 0

possible_set = Set.new

ingredients.each do |ingredient|
  puts 'ingredient: ', ingredient

  ingredient = ingredient.strip
  ingredient = ingredient.to_i

  lines.each do |line|
    puts 'line: ', line
    line = line.strip
    range = line.split('-')

    low = range[0].to_i
    high = range[1].to_i

    # puts 'low: ', low.to_s
    # puts ' high: ', high.to_s

    answer += 1 if low <= ingredient && ingredient <= high
    puts 'answer: ', answer.to_s
    break if low <= ingredient && ingredient <= high
  end
end



puts 'answer: ' + answer.to_s

