require './lib/game'
require 'pry'
### 1. I usually get rid of all 'pry' requirements before submitting a pull request.
### It just cleans up the code a bit and you won't use it in a production env.
### The Javascript equivalent is 'debugger', and we forget all the time.

### 2. I see a good opportunity to make this a bit more readable. You have code
### that does stuff, and other code that is a message to the user. What if we
### put those messages into their own section. We do this in rails a lot with
### error messages. They would really clog up the code, but if we can call
### something like errors.messages.timesheet_events.multiple_clock_in_events 
### you can see how we break down those messages into groups, and we can edit 
### them all together. Also! And I think this is fun, this would be a really easy
### way to start supporting other languages. You've started this process below with 
### def instructions ...

### 4. I saw that one of the extensions is color coding the output. Let me know if 
### you want to tackle that! Time estimate: 25 minutes. There are a few ways to
### do it, but this one is pretty quick: 
### https://stackoverflow.com/questions/1489183/colorized-ruby-output
  

# Variables
@prompt = ">"

# Functions Section
def play_game
  @game = Game.new #call in the Game class and make a new game instance
  
  ### 3. Turing doesn't seem big on comments, but we defintely need them in our app.
  ### 3a. Also, my friend found a code comment from 1989 a few months ago.
  
  # @game.start # start the timer
  @game.generate_right_answer # create a right answer

  puts """
  I have generated a beginner sequence with four elements made up of: (r)ed,
  (g)reen, (b)lue, and (y)ellow.

  Guess any sequence of four colors (ex: rbgy or bbyy).

  Use (q)uit at any time to end the game and return to the main menu.
  """
  #begin game loop
  loop do
    puts "What's your guess?"
    print @prompt
    @guess = gets.chomp.downcase

    if @guess == "q" || @guess == "quit"
      break # quit to the main menu

    elsif @guess == "c" || @guess == "cheat"
      puts "The correct answer is #{@game.right_answer}. Enter that to win."

    elsif @guess.length < @game.right_answer.length
      puts "Your answer is too short. Guess again using only 4 letters."

    elsif @guess.length > @game.right_answer.length
      puts "Your answer is too long. Guess again using only 4 letters."

    else
      @game.add_guess
      # game stuff for incorrect guess
      if @game.is_this_guess_correct(@guess, @game.right_answer) == false
### 5. When we have a method that returns a boolean, we differentiate it by
### ending it in a question mark. So this would become
### @game.is_this_guess_correct?(args)

        @game.how_many_correct_colors(@guess, @game.right_answer)
        @game.how_many_correct_positions(@guess, @game.right_answer)
### 6. A better name for these might be @game.correct_color_count
### and @game.correct_position_count

        puts """
        '#{@guess}' has #{@game.correct_colors} of the correct elements with #{@game.correct_positions} in the correct positions.
        You've taken #{@game.total_guesses} guesses.
        """

      else # game stuff for correct guess
        # @game.stop
        # @game.elapsed_time
        puts """
        Congratulations! You guessed the sequence '#{@game.right_answer}' in #{@game.total_guesses} guesses.

        Do you want to (p)lay again or (q)uit to the main menu?
        """

        loop do
          print @prompt
          @menu_choice = gets.chomp.downcase

          if @menu_choice == "p" || @menu_choice == "play"
            play_game
          elsif @menu_choice == "q" || @menu_choice == "quit"
            break #need it to break out of one more level
          else
            puts "Please enter p or play, q or quit."
          end
        end
        break
      end
    end
  end
end

def instructions
  puts """
  Instructions:

  MASTERMIND is a game where you try to guess the correct color in the correct position of a sequence.

  I will generate a random sequence of 4 colors, (r)ed, (g)reen, (b)lue, and (y)ellow.

  When prompted, you will guess a possible 4-element-long sequence of the colors, for example, rgby or brbb.

  I will then alert you of both:
    - how many color elements you correctly guessed, and

    - how many color elements in your guess are in the correct position within the sequence.

  I will also tell you how many guesses you've taken. Challenge yourself to guess the right answer with the fewest possible guesses.

  Use (q)uit at any time to end the game.
 """
end

# CLI Section

# Welcome Message
loop do

  puts """
  Welcome to MASTERMIND

  Main Menu:
  Would you like to (p)lay, read the (i)nstructions, or (q)uit?
  """

  print @prompt
  @menu_choice = gets.chomp.downcase

  if @menu_choice == "p" || @menu_choice == "play"
    # Call play_game function
    play_game
  elsif @menu_choice == "i" || @menu_choice == "instructions"
    # Call instructions function
    instructions
  elsif @menu_choice == "q" || @menu_choice == "quit"
    # Quit program
    puts "Goodbye."
    break
  else
    puts "Please enter p or play, i or instructions, q or quit."
  end
 end
