class TimeSlot < ApplicationRecord
  belongs_to :activity

  def date
    self.start_time.to_date
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
