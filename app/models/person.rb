class Person < ApplicationRecord

  belongs_to :city
  has_many :items, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true

end
