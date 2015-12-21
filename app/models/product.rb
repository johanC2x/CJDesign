class Product < ActiveRecord::Base
	validates :title , presence: {message: " es requerido"} 
	validates :category , presence: {message: " es requerido"} 
	validates :description , presence: {message: " es requerido"}  

	has_attached_file :cover, styles: { medium: "500x300", thumb: "300x200" }
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ 
end
