class UpdateProfile < Scrivener
  attr_accessor :name
  attr_accessor :email
  attr_accessor :current_email

  def validate
    assert_present :name

    if assert_email :email
      if current_email != email
        user = User.fetch(email)
        assert(user.nil?, [:email, :not_unique])
      end
    end
  end
end
