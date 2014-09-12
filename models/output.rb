class Output < Ohm::Model
  reference :user, :User

  attribute :date
  attribute :duration
  attribute :scale
  attribute :comment
end
