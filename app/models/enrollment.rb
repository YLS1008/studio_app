class Enrollment < ApplicationRecord
  belongs_to :trainee
  belongs_to :time_slot

  before_save :check_if_locked
  before_destroy :check_if_locked



  def self.enroll_to_group(slot, trainee_id)
    slot.mother.time_slots.each do |s|
      next if s.locked

      Enrollment.create!(trainee_id: trainee_id, time_slot_id: s.id, registration: "monthly")
    end
  end

  def self.cancel_group_enrollment(activity_id, trainee_id)
    activity = Activity.find(activity_id)
    activity.time_slots.each do |slot|
      Enrollment.where(trainee_id: @trainee.id, time_slot_id: slot.id).destroy
    end
  end

  private

  def check_if_locked

    if self.time_slot.locked
      throw :abort
    end
  end

end
