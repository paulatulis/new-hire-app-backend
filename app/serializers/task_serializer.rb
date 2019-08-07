class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :complete, :user_id
end
