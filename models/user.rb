class User < Ohm::Model
  attribute :name
  attribute :email
  attribute :password

  collection :inputs,  :Input
  collection :types,   :Type
  collection :outputs, :Output
end
