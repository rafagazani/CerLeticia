class Paciente
	
  include Mongoid::Document
  field :nome, type: String
  field :data_nascimento, :type => String # resolver: como salvar data no mongo
  field :sexo, type: String
  mount_uploader :image, ImageUploader
 
 has_many :posts
 end
