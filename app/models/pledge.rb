class Pledge < ActiveRecord::Base
  validates :amt, numericality: { greater_than: 0 }

  belongs_to :project

  belongs_to(
    :pledger,
    class_name: 'User',
    foreign_key: :pledger_id,
    primary_key: :id
  )
end
