module LoadData
  def read_books
    file_path = './DATA/books.json'
    return unless File.exist?(file_path)

    books_file = File.open(file_path)
    books = []
    JSON.parse(books_file.read).each { |book| books << Book.new(book['Title'], book['Author'], book['id']) }
    books_file.close
    books
  end

  def read_people
    file_path = './DATA/people.json'
    return unless File.exist?(file_path)

    people_file = File.open(file_path)
    people = []
    JSON.parse(people_file.read).each do |person|
      case person['type']
      when 'Student'
        people.push(Student.new(
                      person['classroom'],
                      person['age'],
                      person['name'],
                      person['id'],
                      parent_permission: person['parent_permission']
                    ))

      when 'Teacher'
        people.push(Teacher.new(
                      person['specialization'],
                      person['age'],
                      person['name'],
                      person['id']
                    ))
      end
    end

    people_file.close
    people
  end

  def self.read_rentals(books, people)
    file_path = './DATA/rentals.json'
    return unless File.exist?(file_path)
    return if books.empty?

    rentals_file = File.open(file_path)
    rentals = []
    JSON.parse(rentals_file.read).each do |rental|
      rental_book = books.select { |book| book.id == rental['book_id'] }
      rental_person = people.select { |person| person.id == rental['person_id'] }

      rentals.push(Rental.new(rental_book[0], rental_person[0], rental['date'], rental['id']))
    end
    rentals_file.close
    rentals
  end
end
