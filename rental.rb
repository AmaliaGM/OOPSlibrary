class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
