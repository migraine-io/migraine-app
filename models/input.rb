class Input < Ohm::Model
  reference :user, :User
  reference :type, :Type

  attribute :date
  attribute :category
  attribute :name

  collection :inputs, :Input
end
