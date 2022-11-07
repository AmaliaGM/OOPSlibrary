require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'app'
require_relative 'actions'

class Main
  include App
  include Actions

  def initialize
    @main_ans = 0
    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to School Library App!'
    puts
  end

  def show_options
    sleep(1)
    system('clear')
    system('cls')
    puts '     ███ ███ ███ ╬╬ █╬ █ ██▄ ███ ███ ███ █╬█'
    puts '     █╬█ █╬█ █▄█ ╬╬ █╬ █ █▄█ █▄╬ █▄█ █▄╬ █▄█'
    puts '     █▄█ █▄█ █╬╬ ╬╬ ██ █ █▄█ █╬█ █╬█ █╬█ ╬█╬'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
    print INPUT_MSG
  end

  # rubocop:disable Metrics
  def select_option
    case @main_ans
    when 1
      display_books
      enter_msg
    when 2
      display_people
      enter_msg
    when 3
      user_person_input
    when 4
      user_book_input
    when 5
      user_rental_input unless @books.empty? && @people.empty?
    when 6
      user_rental_id_input
    else
      if @main_ans != 7
        puts 'Invalid input, please try again'
        puts
      end
    end
  end

  # rubocop:enable Metrics-
end
library = Main.new
library.main
