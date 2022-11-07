require_relative './person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission)
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => id,
      'name' => name,
      'age' => age,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
