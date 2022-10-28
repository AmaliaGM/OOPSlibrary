require_relative './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, age, name, id = SecureRandom.uuid, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def self.create_student
    print 'Classroom: '
    classroom = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_user = gets.chomp
    has_permission = case parent_permission_user.downcase
                     when 'y'
                       true
                     else
                       false
                     end

    Student.new(classroom, age, name, parent_permission: has_permission)
  end
end
