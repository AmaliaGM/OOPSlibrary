require 'securerandom'
require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author, id = nil)
    @id = id || SecureRandom.random_number(1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    @rentals.push(rental)
    rental.book = self
  end

  def self.create_book(books)
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books << book

    puts 'Book added successfully'
  end
end
