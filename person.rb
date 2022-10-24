class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id, name, age, parent_permission=true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    if @age >= 18
      puts true
    else
      puts false
    end
  end
end

person1 = Person.new(1, 'Lauren Smith', 25);

puts person1.of_age?
