class Medicine
  include Guacamole::Model
  attribute :cnpj, String
  attribute :razaoSocial, String
  attribute :noRegistro, String
  attribute :codApresentacao, String
  attribute :codBarras, String
  attribute :nomeMedicamento, String
  attribute :descricao, String
  attribute :registroCAS, String
  attribute :nomeSubstancia, String
  attribute :tipoProduto, String
  attribute :vendaHospital, String
  attribute :listaCap, String
  attribute :listaConfaz, String
  attribute :preco, String
  attribute :precoTax, String
end
