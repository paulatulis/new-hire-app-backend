class UserSerializer < ActiveModel::Serializer
  # has_many :lunches
  # has_many :notes
  # has_many :tasks

  attributes :id, :email, :photo, :team, :username, :first_name, :last_name, :title, :bio, :start_date, :location, :manager, :all_LM, :all_tasks


  def all_LM
    self.object.lunches << self.object.my_lunches
  end

  def all_tasks
    self.object.tasks << self.object.my_tasks
  end
end
