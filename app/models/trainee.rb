class Trainee < ApplicationRecord

    def get_enrolled_time_slots
        @time_slots_enrolled = TimeSlot.new
        time_slots_id_arr = self.enrolled.split(';')
        time_slots_id_arr.each do |id|
            @time_slots_enrolled + TimeSlot.find(id)
        end
         return @time_slots_enrolled
    end

    def cancel_enrollment(cancel_id)
        time_slots_id_arr = self.enrolled.split(';')
        time_slots_id_arr.delete(cancel_id)
        new_enrollment = ""
        time_slots_id_arr.each do |id|
            new_enrollment + id + ';'
        end
        self.update_attribute(:enrolled => new_enrollment)
    end
end
