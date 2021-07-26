class Project < ApplicationRecord
  has_many :editions, class_name: 'Project',
                      foreign_key: 'parent_id'

  belongs_to :parent, class_name: 'Project', optional: true

  has_one_attached :cover
end
