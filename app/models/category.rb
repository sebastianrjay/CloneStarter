class Category < ActiveRecord::Base

  attr_accessor :num_projects
  
  validates :name, presence: true, uniqueness: true

  has_many :projects
end
