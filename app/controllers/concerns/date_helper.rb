module DateHelper
    extend ActiveSupport::Concern

    def copy_recurring_event(last_entry, curr_start, curr_end)
        run_end_date = Date.new(2021, 9, 1)
        next_start = curr_start + 1.week
        next_end = curr_end + 1.week

        if next_start.to_datetime.to_date > run_end_date
            return false
        end

        @next_entry = last_entry.dup
        @next_entry.assign_attributes(start_time: next_start, end_time: next_end)

        return @next_entry.save

    end

end