class CreateType < Scrivener
  attr_accessor :category
  attr_accessor :name

  def validate
    assert_present :category
    assert_present :name
  end
end
