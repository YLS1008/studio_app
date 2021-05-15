class Enrollment < ApplicationRecord
  belongs_to :trainee
  belongs_to :time_slot

  before_save :check_if_locked
  before_destroy :check_if_locked

  private

  def check_if_locked
    if self.time_slot.locked
      throw :abort
    end
  end
end
