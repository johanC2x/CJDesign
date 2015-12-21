class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :cover, styles: { medium: "500x300", thumb: "300x200" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  has_many :articles 
  has_many :comments
end
