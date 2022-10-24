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
end