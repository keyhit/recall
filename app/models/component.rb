class Component < ApplicationRecord
  belogs_to :project
  has_many :tasks
end
