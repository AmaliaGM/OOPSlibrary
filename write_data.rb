require 'json'

module WriteData
  def books_write(book)
    File.write('./DATA/books.json', JSON.pretty_generate(book)) 
  end
end
