class Output < Ohm::Model
  reference :user, :User

  attribute :happened_at
  attribute :duration
  attribute :scale
  attribute :comment
end
