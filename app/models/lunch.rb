class Lunch < ApplicationRecord
  belongs_to :user
  belongs_to :colleague, class_name: "User"
  
  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_options)
  end

  def destroy_inverses
    self.inverses.destroy_all
  end 

  def inverses
    self.class.where(inverse_options)
  end

  def has_inverse?
    self.class.exists?(inverse_options)
  end 

  def inverse_options
    {
      user_id: self.colleague_id,
      colleague_id: self.user_id
    }
  end
  
end
