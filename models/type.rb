class Type < Ohm::Model
  reference :user, :User

  attribute :category
  attribute :name

  collection :inputs, :Input
end
