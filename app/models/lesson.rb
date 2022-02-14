class Lesson < ApplicationRecord
  belongs_to :section
  validates :title, :description, presence: true 
end
