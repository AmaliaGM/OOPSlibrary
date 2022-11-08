require 'json'
  
module AppBis
  INPUT_MSG = 'Enter an option number here: '.freeze
  ENTER_MSG = 'Press ENTER to continue'.freeze

  def load_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'), create_addititons: true)
    else
      []
    end
  end

  def load_persons
    if File.exist?('persons.json')
      JSON.parse(File.read('persons.json')).map do |person|
        if person['json_class'] == 'Student'
          load_student(person, 'learn to code')
        else
          load_teacher(person)
        end
      end
    else
      @person = []
    end
  end

  def load_teacher(person)
    id = person['id'].to_i
    name = person['name']
    age = person['age']
    specialization = person['specialization']

    teacher = Teacher.new(age, specialization, name)
    teacher.id = id
    @persons.push(teacher)
  end

  def load_student(person, classroom)
    id = person['id'].to_i
    name = person['name']
    age = person['age']
    parent_permission = person['parent_permission']

    student = Student.new(age, classroom, name, parent_permission)
    student.id = id
    @person.push(student)
  end

  def load_rentals(person, books)
    if File.exist?('rentals.json')
      JSON.parse(File.read('rentals.json')).map do |rental|
        book = books.find { |curr_book| curr_book.title == rental['book'] }
        person = person.find { |curr_person| curr_person.id == rental['person'].to_i }

        @rentals.push(Rental.new(rental['date'], person, book))
      end
    else
      @rentals = []
    end
  end

  def save_files
    File.write('books.json', JSON.generate(@books)) if @books.any?
    File.write('persons.json', JSON.generate(@people)) if @people.any?
    File.write('rentals.json', JSON.generate(@rentals)) if @rentals.any?
  end
end
