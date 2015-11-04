class Post
  include Mongoid::Document
  include ActiveModel::AttributeMethods
  
  field :titulo
  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader
  validates_presence_of :titulo, :image, :audio
 
 belongs_to :paciente
end
