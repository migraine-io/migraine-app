class Input < Ohm::Model
  reference :user, :User
  reference :type, :Type

  attribute :happened_at
  attribute :comment
end
