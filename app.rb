require './book'
require './person'
require './rental'
require './json_handler'
require './refactor'

class App
  attr_reader :books, :persons, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all retals for a given person id'
    puts '7 - Exit'
  end

  def options(input)
    case input
    when '1' then Book.list_all_books(@books)
    when '2' then list_all_persons
    when '3' then Book.create_book(@books)
    when '4' then Person.create_person(@persons)
    when '5' then Rental.create_rental(@books, @persons, @rentals)
    when '6' then Rental.list_all_rentals_for_id(@rentals)
    when '7'
      puts 'Thank you for using this app!'
      save_files
    else
      puts 'invalid operator'
  end
end

def list_all_persons
  if @persons.empty?
    puts 'There are no people yet! Kindly add a student or teacher.'
  else
    @persons.each_with_index do |person, index|
      puts "#{index} ) [ #{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

def list_all_books
  if @books.empty?
    puts 'There are no books yet! Kindly add books.'
  else
    @books.each_with_index do |book, index|
      puts "#{index} ) Title: #{book.title}, Author: #{book.author}"
    end
  end
end

  def run 
    loop do
    self.menu
    user_input = gets.chomp
    break if user_input == '7'
    options(user_input) 
    end
  end
end
