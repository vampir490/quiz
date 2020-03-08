require 'rexml/document'

# Game class. Contains the constants with game settings and manages the quiz process
class Quiz
  # A constant which sets the number of questions played
  NUMBER_OF_QUESTIONS = 5

  attr_reader :playing_questions
  attr_accessor :points, :correct_answers

  # Creates the instance of the Quiz
  # Uses incoming parameter 'path' with the path to xml file with questions
  def self.from_file(path)
    # reading the file with questions
    file = File.read(path, encoding: 'UTF-8')
    doc = REXML::Document.new(file)

    # It gradually goes through xml file with questions and answers,
    # reading the data
    # and creating the array of the instances of Question class
    questions = doc.elements.to_a('//question').map do |element|
      text = element.elements['text'].text
      variants = element.elements.to_a('variants/variant').map { |variant| variant.text }
      variants.shuffle!
      correct_answer = element.elements["variants/variant[@right='true']"].text
      points = element.attributes['points']
      time = element.attributes['seconds'].to_i
      Question.new(text, variants, correct_answer, points, time)
    end

    # In the end we create the instance of the Quiz
    new(questions)
  end

  # Initializes the instance of Quiz, taking the parameter, which is the array of Question instances
  def initialize(questions)
    @playing_questions = questions.sample(NUMBER_OF_QUESTIONS)
    @points = 0
    @correct_answers = 0
  end

  # The method to increase the user's account.
  # Increases points and the counter of right answers
  # It is called only in case of right answer
  def add_points(points)
    @correct_answers += 1
    @points += points
  end

  # Returns final results, using special method 'sklonyator' to set word 'point(s)' to the right form
  def show_results
    "Correct answers: #{@correct_answers} out of #{NUMBER_OF_QUESTIONS}\n" \
    "You got #{@points} #{Sklonyator.sklonenie(@points, 'point', 'points', 'points')}"
  end
end
