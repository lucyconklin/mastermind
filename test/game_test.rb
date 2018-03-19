require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_there_are_4_colors_to_start
    assert_equal 4, @game.colors.length
  end

  def test_right_answer_starts_as_empty_array
    assert_equal [], @game.right_answer
  end

  def test_four_colors_generate_with_right_answer
    @game.generate_right_answer
    assert_equal 4, @game.right_answer.length
  end

  def test_total_guesses_starts_as_0
    assert_equal 0, @game.total_guesses
  end

  def test_adds_guess_increases_total_guesses_by_1
    @game.add_guess
    assert_equal 1, @game.total_guesses
  end

  def test_if_this_guess_is_correct
    @right_answer = ["r", "b", "g", "y"]
    @guess = "rbgy"
    assert_equal true, @game.is_this_guess_correct(@guess, @right_answer)
  end

  def test_correct_colors_starts_as_0
    assert_equal 0, @game.correct_colors
  end

  def test_correct_colors_returns_integer

  end

  def test_correct_positions_starts_as_0
    assert_equal 0, @game.correct_positions
  end

  # def test_if_guessed_colors_are_present_in_right_answer
  #   @right_answer = ["r", "b", "g", "y"]
  #   @guess = "rbgy"
  # end
end
=begin
Stuff needed for timer:
def test_timer_starts_set_to_nil
  assert_equal 0, @start
end

def test_timer_gets_set_to_Time_now
  assert_equal Time.now, @start
end

=end
