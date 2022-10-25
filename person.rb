require_relative './nameable'
require_relative './decorator'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id, name, age, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end

person1 = Person.new(1, 'Lauren Smith', 25)

puts person1.of_age?
