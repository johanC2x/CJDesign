class Article < ActiveRecord::Base
	belongs_to :user 
	has_many :comments
	validates :titles,presence: true,uniqueness: true
	validates :description,presence: true,length:{ minimum:20 }

	#has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	#validates_attachment_content_type :cover, :content_type => [/png\Z/, /jpe?g\Z/, /gif\Z/]
 
	has_attached_file :cover, styles: { medium: "500x300", thumb: "300x200" }
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  	#scope_article
  	scope :ordenados, -> { order("created_at DESC") }
  	scope :publish, -> {where("publish = ?",1)}
end   
  