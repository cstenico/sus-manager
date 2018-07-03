class User
  include Guacamole::Model

  attribute :name, String
  attribute :email, String
  attribute :password, String
  attribute :role, String
  attribute :cpf, String
end
