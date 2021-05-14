class TimeSlot < ApplicationRecord
  belongs_to :activity
  has_many :enrollments, dependent: :destroy
  has_many :trainees, through: :enrollments

  def self.get_sister_slots(id)
    slots_to_return = []
    curr_slot = TimeSlot.find(id)
    slots_to_return.push(curr_slot)
    loop do
      if curr_slot.nil?
        return slots_to_return.reject {|slot| slot.nil? }
      end
      curr_time = curr_slot.start_time
      next_slot = TimeSlot.where(start_time:  curr_time + 1.week).first
      if next_slot.nil? && curr_slot.start_time > Date.new(2021, 9, 1)
        return slots_to_return.reject {|slot| slot.nil? }
      else
        curr_slot = next_slot
      end
      slots_to_return.push(next_slot)
    end
  end


  def get_clean_datetime(param)
    self.start_time.to_s(param)
  end



  def duration
    duration_in_seconds = Activity.find(self.activity_id).duration * 60
    return Time.at(duration_in_seconds).utc.strftime("%H:%M:%S")        
  end

  def mother
    Activity.find(self.activity_id)
  end

  def self.query_for_activities(q_type)
    if q_type == "homepage"
      start_date = Date.today.beginning_of_week
      end_date = start_date + 2.week
      return TimeSlot.where(start_time: (start_date..end_date))
    end
  end

end


