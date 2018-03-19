require 'pry'

class Game
attr_reader :colors,
            :right_answer,
            :total_guesses,
            :correct_colors,
            :correct_positions,
            :concurrent_positions

  def initialize
    # @colors = [["r", "b", "g", "y"], ["r", "b", "g", "y"], ["r", "b", "g", "y"], ["r", "b", "g", "y"]]
    @colors = %w[r b g y]
    @right_answer = []
    @total_guesses = 0
    @correct_colors = 0
    @correct_positions = 0
    @concurrent_positions = []
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
  player_guess.chars == current_right_answer
end

#return number of correct colors
def how_many_correct_colors(player_guess, current_right_answer)
  #(player_guess.chars.length).times do
   @correct_colors = current_right_answer.uniq.count do |color|
    player_guess.chars.include?(color)
  end
  #some integer-giving comparison between player_guess.chars and current_right_answer; in boolean, true = 1; include? would give a +=1
  #end
end

  def how_many_correct_positions(player_guess, current_right_answer)
    @concurrent_positions = current_right_answer.zip(player_guess.chars)
      @correct_positions = concurrent_positions.count do |answer, guess|
        answer == guess
      end
      #not include? bc not index-specific
      #each_with_index just prints the elements with their indeces
      #current_right_answer.select.count do something with the player_guess.chars
      #zip works with nuance best, zippers the two arrays into one subarray in each index

  end

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

=end
