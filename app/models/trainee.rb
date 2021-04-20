class Trainee < ApplicationRecord

    def get_enrolled_time_slots
        time_slots_id_arr = self.enrolled.split(';').map(&:to_i)
        @time_slots_enrolled = TimeSlot.find(time_slots_id_arr)
         return @time_slots_enrolled
    end

    def cancel_enrollment(cancel_id)
        time_slots_id_arr = self.enrolled.split(';')
        time_slots_id_arr.delete(cancel_id)
        new_enrollment = ""
        time_slots_id_arr.each do |id|
            new_enrollment + id + ';'
        end
        self.update(enrolled: new_enrollment)
        self.update(ticket: self.ticket + 1)

    end

    def is_enrolled?(time_slot_id)
        time_slots_id_arr = self.enrolled.split(';').map(&:to_i)
        time_slots_id_arr.each do |id|
            if id == time_slot_id
                return true
            end
        end
        return false
    end

    def finalize_enroll(time_slot_id)
        self.update(enrolled: self.enrolled + "#{time_slot_id};")
        self.update(ticket: self.ticket - 1)
    end
end
