class Output < Ohm::Model
  include Ohm::DataTypes
  reference :user, :User

  attribute :date, Type::Date
  attribute :duration, Type::Integer
  attribute :scale, Type::Integer
end
