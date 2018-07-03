class LocalStorage
  include Guacamole::Model

  attribute :name, String
  attribute :city, String
  attribute :vlr_latitude, String
  attribute :vlr_longitude, String
  attribute :cod_munic, String
  attribute :cod_cnes, String
  attribute :dsc_endereco, String
  attribute :dsc_bairro, String
  attribute :dsc_telefone, String
  attribute :dsc_estrut_fisic_ambiencia, String
  attribute :dsc_adap_defic_fisic_idosos, String
  attribute :dsc_equipamentos, String
  attribute :dsc_medicamentos, String
  attribute :medicines, Array[Medicine]

end
