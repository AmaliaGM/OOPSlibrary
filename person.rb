require_relative './nameable'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, id, parent_permission: true)
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

  def self.create_person(persons)
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp.to_i

    case option

    when 1

      person = create_student
    when 2

      person = create_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
    persons << person

    # print "#{person.class} created successfully\n"
  end

  def self.create_student
    print 'Classroom: '
    classroom = gets.chomp

    print 'Age: '
    age = Interger(gets.chomp)

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_user = gets.chomp
    case parent_permission_user.downcase
    when 'y'
      true
    else
      false
    end

    person = Student.new(classroom, age, name, parent_permission)
    @persons << person
    puts 'Student created'
  end

  def self.create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    puts 'Teacher created'
  end

  private

  def of_age?
    @age >= 18
  end
end
# rubocop:enable Metrics/MethodLength
