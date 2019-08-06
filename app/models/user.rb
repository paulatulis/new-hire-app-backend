class User < ApplicationRecord
  has_secure_password
  has_many :lunches, dependent: :destroy
  has_many :colleagues, through: :lunches
  
  has_many :tasks

  def my_lunches
    Lunch.where("user_id = ?", self.id)
  end

  def my_tasks
    Task.where("user_id = ?", self.id)
  end

  validates :username, {
    length: {minimum: 3, maximum: 20},
  	uniqueness: {case_sensitive: false}
  }

  validates :password, {
    presence: true,
  	length: {minimum: 3, maximum: 20}
  }

  validates :first_name, :last_name, {
    presence: true,
    length: {maximum: 20}
  }
end