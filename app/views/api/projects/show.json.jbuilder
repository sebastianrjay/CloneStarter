json.extract! @project, :id, :starter_id, :title, :city, :summary, :description,
  :category_id, :pledge_total, :pct_funded, :end_date, :created_at, :updated_at,
  :fund_goal, :main_image_url, :secondary_image_url, :days_left, :starter_name

if current_user &&
    (current_user.pledged_projects.include?(@project) || @project.starter == current_user)
  json.commentable true
else
  json.commentable false
end

json.num_comments @project.comments.length

json.num_backers @project.pledges.length

json.partial! 'api/comments/comments', comments: @project.comments

json.backers @project.pledgers do |backer|
  json.username backer.username
end

json.rewards @project.rewards do |reward|
  json.min_amt reward.min_amt
  json.summary reward.summary
  json.est_delivery reward.est_delivery
  json.project_id reward.project_id
  json.created_at reward.created_at
  json.updated_at reward.updated_at
end

json.pledges @project.pledges do |pledge|
  json.amt pledge.amt
  json.pledger_id pledge.pledger_id
  json.project_id pledge.project_id
  json.created_at pledge.created_at
  json.updated_at pledge.updated_at
end

json.backers @project.pledgers do |pledger|
  json.username pledger.username
end

json.starter do
  json.id @project.starter.id
  json.username @project.starter.username
  json.bio @project.starter.bio
end
