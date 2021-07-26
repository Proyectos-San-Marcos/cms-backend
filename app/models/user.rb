class User < ApplicationRecord
  belongs_to :area
  belongs_to :career
  has_one_attached :photo
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
end
