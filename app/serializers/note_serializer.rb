class NoteSerializer < ActiveModel::Serializer
  attributes :id, :task_id, :body
end
