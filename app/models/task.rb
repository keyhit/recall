class Task < ApplicationRecord
  belogs_to :component
  has_many :comments
end
