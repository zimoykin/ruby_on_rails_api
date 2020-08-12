class Person < ApplicationRecord

  belongs_to :city

  validates :name, presence: true, uniqueness: true

  validates :city, presence: true

end
