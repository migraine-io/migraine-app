class UpdatePassword < Scrivener
  attr_accessor :password
  attr_accessor :password_confirmation

  def validate
    assert_present :password
    assert_present :password_confirmation
    assert password == password_confirmation, [:password, :not_confirmed]
    assert password.length > 5, [:password, :too_small]
  end
end
