class Management < ApplicationRecord
  has_many :areas, dependent: :destroy
  has_one_attached :cover
end
