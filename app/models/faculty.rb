class Faculty < ApplicationRecord
  has_many :careers, dependent: :destroy
  has_one_attached :cover
end
