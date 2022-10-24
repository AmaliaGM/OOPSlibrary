require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, id = SecureRandom.uuid)
    super(age, name, id,)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
