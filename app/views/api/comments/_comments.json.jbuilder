json.comments comments do |comment|
  json.id comment.id
  json.body comment.body
  json.username comment.commenter.username
  json.project_id comment.project_id
  json.created_at comment.created_at
  json.updated_at comment.updated_at
end
