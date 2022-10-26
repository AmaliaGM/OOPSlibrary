require_relative './rental'

class Book
  attr_accesor :title, :author, :rentals, :id

  def initialize(title, author, id)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    @rentals.push(rental)
    rental.book = self
  end
end
