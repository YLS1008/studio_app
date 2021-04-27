class Child < ApplicationRecord
  belongs_to :trainee

  def self.is_child?(id)
    @parent = Child.where(child_trainee_id: id)
    if @parent.empty?
      return false
    else
      return true
    end
  end

  def self.get_parent(id)
    @parent = Child.where(child_trainee_id: id).first
    return Trainee.find(@parent.trainee_id)
  end
end
