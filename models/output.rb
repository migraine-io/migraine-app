class Output < Ohm::Model
  include Ohm::DataTypes

  DURATIONS = {
   "30" => "30 min",
   "60" => "1 hour",
   "120" => "2 hour",
   "240" => "4 hour",
   "480" => "8 hour",
   "1440" => "all the day"
  }

  reference :user, :User

  attribute :date, Type::Date
  attribute :duration, Type::Integer
  attribute :scale, Type::Integer
end
