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

  def cancel_enrollment(cancel_id)
    enrolled_id_arr = self.enrolled.split(';')
    enrolled_id_arr.delete(cancel_id)
    new_enrollment = ""
    enrolled_id_arr.each do |id|
        new_enrollment + id + ';'
    end
    self.update(enrolled: new_enrollment)
    self.update(occupancy: self.occupancy - 1)
  end

  def get_enrolled_trainees
    trainees_id_arr = self.enrolled.split(';').map(&:to_i)
    @enrolled = Trainee.find(trainees_id_arr)
     return @enrolled
  end

  def finalize_enroll(trainee_id)
    self.update(enrolled: self.enrolled + "#{trainee_id};")
    self.update(occupancy: self.occupancy + 1)
end

def get_enrolled_trainees
  trainee_id_arr = self.enrolled.split(';').map(&:to_i)
  @trainees_enrolled = Trainee.find(trainee_id_arr)
   return @trainees_enrolled
end

end


