class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :part
  has_many :comments, dependent: :destroy
end
