class City < ApplicationRecord
    has_many :people, dependent: :destroy
    validates :title, presence: true,  uniqueness: true
end
