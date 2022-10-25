require_relative './nameable'
require_relative './base_decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

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

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
capitalized_trimmed_person.correct_name
