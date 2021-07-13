class EvaluatedUser < ApplicationRecord
  belongs_to :user
  belongs_to :evaluation
end
