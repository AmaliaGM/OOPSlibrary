require_relative './nameable'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name, id, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def self.create_person(people)
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp.to_i

    case option

    when 1
      person = Student.create_student
    when 2
      person = Teacher.create_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
    people << person

    print "#{person.class} created successfully\n"
  end

  private

  def of_age?
    @age >= 18
  end
end
