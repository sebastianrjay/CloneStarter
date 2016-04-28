class Comment < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true
  validates :commenter_id, :project_id, presence: true

  belongs_to :project

  belongs_to(
    :commenter,
    class_name: 'User',
    foreign_key: :commenter_id,
    primary_key: :id
  )
end
