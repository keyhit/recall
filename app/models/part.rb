class Part < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
