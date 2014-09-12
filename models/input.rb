class Input < Ohm::Model
  include Ohm::DataTypes

  attribute :date, Type::Date

  reference :user, :User
  reference :type, "::Type"
end
