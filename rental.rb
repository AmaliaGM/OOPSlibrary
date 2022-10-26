class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
  end
end
