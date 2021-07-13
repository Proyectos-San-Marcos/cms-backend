class User < ApplicationRecord
  belongs_to :area
  belongs_to :career
  has_one_attached :photo
end
