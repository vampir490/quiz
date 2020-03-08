require_relative 'lib/quiz'
require_relative 'lib/sklonyator'
require_relative 'lib/question'
require 'timeout'

# This code is necessary to make the program work with russian symbols on Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Creating the Quiz, providing the path of the file with questions
file_name = "#{File.dirname(__FILE__)}/data/questions.xml"
quiz = Quiz.from_file(file_name)

quiz.playing_questions.each do |question|
  answer = nil
  # Asking the questions
  begin
    puts question
    # Setting timeout for the question
    Timeout::timeout(question.time_to_answer) do
      # Showing the options
      puts question.give_variants
      puts question.time_notification

      # Getting and checking the answer
      answer = STDIN.gets.to_i
    end
  rescue Timeout::Error
    puts 'You spent too much time to answer'
    exit
  end

  # Checking the answer
  if question.answer_correct?(question.variants[answer - 1])
    puts 'Correct!'
    quiz.add_points(question.points)
  else
    puts 'Not correct'
    puts "The right one is: #{question.correct_answer}"
  end
end

# Show the result
puts
puts 'Results:'
puts quiz.show_results
