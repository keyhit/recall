class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :parts, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
