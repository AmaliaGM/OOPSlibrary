require_relative './nameable'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name, parent_permission: true)
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

  def can_use_services?
    of_age? || @parent_permission
  end

  def self.list_all_people(people)
    if people.empty?
      puts 'There are no people yet! Kindly add a student or teacher.'
    else
      people.each_with_index do |person, index|
        puts "#{index} ) [ #{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
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

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus', 1)
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

puts person.name
