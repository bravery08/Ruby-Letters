def most_repeated(string)
  highest_repeat = 2
  highest = []
  string.split(' ').each do |word|
    occurences = {}
    word.each_char do |char|
      occurences.has_key?(char) ? occurences[char] += 1 : occurences[char] = 1
    end
    high = occurences.sort_by{|key, value| value}.reverse.first.last
    if high == highest_repeat
      highest_repeat = high
      highest << word
    elsif high > highest_repeat
      highest_repeat = high
      highest = [word]
    end
  end
  if highest.length >= 2
    puts "Multiples Found: #{highest.join(',')}"
  elsif highest.length == 1
    puts "Highest repeated letters is in the word: #{highest.join(',')}"
  else
    puts 'No word with enough repeated letters.'
  end
end

def run
  puts 'Letters Menu'
  puts '1) Your Input'
  puts '2) Exit'
  case gets.to_i
    when 1
      puts "What's Your Input?"
      most_repeated(gets.strip)
    when 2
      puts 'Thanks For Using My Program'
      exit
    else
      puts 'Bad Input. Try Again.'
      run
  end
  run
end

run