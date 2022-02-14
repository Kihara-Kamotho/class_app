class Course < ApplicationRecord
	validates :title, :description, presence: true 
	has_many :sections 
	has_many :lessons, through: :sections 

	attr_accessor :tutor

end
