require './book'
require './person'
require './rental'
require './json_handler'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    super()
    @persons = []
    @books = []
    @rentals = []
  end

  puts 'Please choose an option by entering a number'
  op = gets.chomp

  case op
  when '1'
    puts '1 - List all books'
    Book.list_all_books(@books)
  when '2'
    puts '2 - List all persons'
    Person.list_all_persons(@persons)
  when '3'
    puts '3 - Create a book'
    Book.create_book(@books)
  when '4'
    puts '4 - Create a person'
    Person.create_person(@persons)
  when '5'
    puts '5 - Create a rental'
    Rental.create_rental(@books, @persons, @rentals)
  when '6'
    puts '6 - List all rentals for a given person id'
    Rental.list_all_rentals_for_id(@rentals)
  when '7'
    puts 'Thank you for using this app!'
    save_files
  else
    puts 'invalid operator'
  end
end
