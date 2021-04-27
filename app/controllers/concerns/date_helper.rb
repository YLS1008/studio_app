module DateHelper
    extend ActiveSupport::Concern

    def copy_recurring_event(last_entry, curr_start)
        run_end_date = Date.new(2021, 9, 1)
        next_start = curr_start + 1.week

        if next_start.strftime("%d.%m.%y")time.strftime("%d.%m.%y") > run_end_date
            return false
        end

        @next_entry = last_entry.dup
        @next_entry.assign_attributes(start_time: next_start)

        return @next_entry.save

    end

end