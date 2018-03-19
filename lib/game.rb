require 'pry'

class Game
attr_reader :colors,
            :right_answer,
            :total_guesses,
            :correct_colors,
            :correct_positions

  def initialize
    # @colors = [["r", "b", "g", "y"], ["r", "b", "g", "y"], ["r", "b", "g", "y"], ["r", "b", "g", "y"]]
    @colors = %W[r b g y]
    @right_answer = []
    @total_guesses = 0
    @correct_colors = 0
    @correct_positions = 0
  end

#generate right_answer with colors that can repeat; scalable to harder games/more colors
  def generate_right_answer
    (@colors.length).times do
      @right_answer << @colors.sample
    end
  end

#add guess to total guesses
  def add_guess
    @total_guesses += 1
  end

#checks both color element presence and index position in right_answer
def is_this_guess_correct(player_guess, current_right_answer)
  #return number of correct colors
 (player_guess.chars.length).times do
   @correct_colors += ()
 end

  @correct_positions <<

  player_guess.chars == current_right_answer
end

  # def check_colors(player_guess, current_right_answer)
  #   player_guess.chars
  #
  # end
  #
  # def check_position(player_guess, current_right_answer)
  #
  # end
end

=begin
Stuff needed for timer:
:start,
:stop,
:minutes,
:seconds

@start = nil
@stop = nil
@seconds = 0
@minutes = 0

def start
  #start timer
  @start = Time.now
end

def stop
  # stop timer
  @stop = Time.now
end

def elapsed_time
  @minutes = (@stop - @start).min  #unsure if it should be / 60 vs. .min
  @seconds = ((@stop - @start) - @minutes).sec
end

couldn't get @right_answer set to generated answer for full check:
def is_this_guess_correct(player_guess)
  @this_guess = player_guess.chars
  @this_guess == @right_answer

  # player_guess.all? do |element|
  # element.eql?(@right_answer) #is this element found in the same indexed position in @right_answer?
  # end
end
=end
