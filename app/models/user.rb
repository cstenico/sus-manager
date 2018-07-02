class User
  include Guacamole::Model

  attribute :name, String
  attribute :email, String
  attribute :password, String
end
