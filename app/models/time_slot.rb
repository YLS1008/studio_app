class TimeSlot < ApplicationRecord
  belongs_to :activity
  has_many :enrollments
  has_many :trainees, through: :enrollments



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


