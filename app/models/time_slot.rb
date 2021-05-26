class TimeSlot < ApplicationRecord
  belongs_to :activity
  has_many :enrollments, dependent: :destroy
  has_many :trainees, through: :enrollments

  def self.graph_slots(last_slot)
    prev_sister_slots_ids = []
    6.times do |n|
      curr_slot_as_arr = TimeSlot.find_by(activity_id: last_slot.mother.id, start_time: last_slot.start_time - n.week)
      if curr_slot_as_arr.nil? then next else prev_sister_slots_ids.push(curr_slot_as_arr.id) end
    end
    return TimeSlot.find(prev_sister_slots_ids)
  end

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
      return TimeSlot.where(start_time: (start_date..end_date)).select {|x| x.mother.contract_if_exists.rate_type != "hourly"}
    end
  end

end


