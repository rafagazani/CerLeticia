class PacientePost
  include Mongoid::Document
  field :id_paciente, type: String
  field :id_post, type: String
  field :visualizacoes, type: Integer

   has_many :posts
   has_many :pacientes
end
