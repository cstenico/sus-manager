class LocalStorage
  include Guacamole::Model

  attribute :name, String
  attribute :city, String
  attribute :medicines, Array[Medicine]

end
