# The class of Question manages questions of the game
class Question
  attr_reader :text, :variants, :correct_answer, :points, :time_to_answer

  # Variables: question itself, answer options, right answer, number of points and time to answer (60 by default)
  def initialize(text, variants, correct_answer, points, time_to_answer = 60)
    @text = text
    @variants = variants
    @correct_answer = correct_answer
    @points = points.to_i
    @time_to_answer = time_to_answer
  end

  # Shows the text of the question
  def to_s
    "#{@text} (#{@points} #{Sklonyator.sklonenie(@points, 'point', 'points', 'points')})"
  end

  # Gets the user's answer and checks whether it is correct
  def answer_correct?(answer)
    @correct_answer == answer
  end

  # Provides the answer options of the question
  def give_variants
    @variants.each.with_index(1).map { |variant, index| "#{index}. #{variant}" }.join("\n")
  end

  # Returns the phrase with the time left for the answer
  def time_notification
    "You have #{@time_to_answer / 60} min #{@time_to_answer % 60} sec left"
  end
end
