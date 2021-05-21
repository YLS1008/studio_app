class MonthlyPayment < ApplicationRecord
  belongs_to :activity
  belongs_to :trainee


  def self.status(month, ids_arr, activity_id)
    status_hash = Hash.new
    ids_arr.each do |id|
      trainee = Trainee.find(id)
      if MonthlyPayment.where(activity_id: activity_id, trainee_id: id, month: month).empty?
        status_hash[trainee] = false
      else
        status_hash[trainee] = true
      end
    end

    return status_hash
  end
end
