class Reward < ActiveRecord::Base
  validates :est_delivery, presence: true
  validates :min_amt, uniqueness: true, numericality: { greater_than: 0 }
  validates :summary, presence: true, length: { maximum: 160 }, uniqueness: true

  belongs_to :project
end
