class Patient
    include Guacamole::Model
  
    attribute :name, String
    attribute :cpf, String
    attribute :telefone, String

end
  