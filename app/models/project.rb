class Project < ActiveRecord::Base

  attr_accessor :days_left, :pct_funded

  validates :starter_id, :title, :fund_goal, :description, :end_date,
    :main_image_url, :city, presence: true

  validates :title, :description, :summary, uniqueness: true
  validates :summary, presence: true, length: { maximum: 160 }
  # validates_format_of :fund_goal, with: /\A\$?[0-9]+(\.[0-9][0-9])?\z/

  belongs_to(:starter,
    class_name: 'User',
    foreign_key: :starter_id,
    primary_key: :id
  )

  belongs_to :category

  has_many :rewards
  has_many :comments
  has_many :pledges

  has_many :pledgers, through: :pledges, source: :pledger

  def starter_name
    self.starter.username
  end

  def set_days_left!
    self.days_left =
      (self.end_date.beginning_of_day.to_i - DateTime.current.to_i) / 86400
  end

  def set_pct_funded!
    self.pct_funded = (100 * self.pledge_total.to_f / self.fund_goal).round(1)
  end
end
