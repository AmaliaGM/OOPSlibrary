module ReadData
  def book_loading
    if File.exist?('./DATA/books.json')
      books = File.open('./DATA/books.json')
      data = books.read
      JSON.parse(data)
    else
      File.write('./DATA/books.json')
    end
  end
end
