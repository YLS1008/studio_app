module AdminsHelper

    def relevant_months(activities)
        months_arr = []
        activities.each do |activity|
            months_arr.push(TimeSlot.where(activity_id: activity.id).pluck(:start_time).map {|x| x.strftime("%B %Y")}.uniq)
        end
        ret_arr = months_arr.flatten.uniq
        return ret_arr.map {|x| [x, x.to_datetime.month]}
    end

end
