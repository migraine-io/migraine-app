class Input < Ohm::Model
  include Ohm::DataTypes

  attribute :date, Type::Date

  reference :user, :User
  reference :type, "::Type"

  def description
    "#{ type.category } - #{ type.name }"
  end
end
