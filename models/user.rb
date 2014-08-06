class User < Ohm::Model
  include Shield::Model

  attribute :name
  attribute :email
  attribute :crypted_password

  collection :inputs,  :Input
  collection :types,   :Type
  collection :outputs, :Output

  unique :email

  def self.fetch(email)
    User.with(:email, email)
  end
end
