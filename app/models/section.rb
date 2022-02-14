class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons
  validates :title, :description, presence: true 
end
