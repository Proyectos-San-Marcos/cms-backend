class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  # Self-Join
  has_many :editions, class_name: 'Project',
                      foreign_key: 'parent_id',
                      dependent: :nullify,
                      inverse_of: :parent

  belongs_to :parent, class_name: 'Project', optional: true

  has_one_attached :cover
end
