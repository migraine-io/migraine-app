class SignUp < Scrivener
  attr_accessor :name
  attr_accessor :email
  attr_accessor :password

  def validate
    assert_present :name

    if assert_email :email
      user = User.fetch(email)
      assert(user.nil?, [:email, :not_unique])
    end

    assert_present :password
    assert password.length > 5, [:password, :too_small]
  end
end
