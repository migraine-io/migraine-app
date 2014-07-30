class User < Ohm::Model
  attribute :name
  attribute :email
  attribute :password
end

class SignUp < Scrivener
  attr_accessor :name
  attr_accessor :email
  attr_accessor :password

  def validate
    assert_present :name
    assert_email   :email
    assert_present :password
  end
end
