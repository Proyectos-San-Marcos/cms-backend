class Project < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
  validate :validate_dates

  def validate_dates
    return if released_at.nil? || finished_at.nil?
    return unless released_at >= finished_at

    errors.add(:finished_at,
               'The finish date must not precede the release date')
  end

  # Associations
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_one_attached :cover

  # Self-Join
  has_many :editions, class_name: 'Project',
                      foreign_key: 'parent_id',
                      dependent: :nullify,
                      inverse_of: :parent

  belongs_to :parent, class_name: 'Project', optional: true
end
