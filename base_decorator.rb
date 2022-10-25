require_relative './nameable'

class BaseDecorator < Nameable
  attr_accesor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
