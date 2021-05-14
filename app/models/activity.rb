class Activity < ApplicationRecord
  belongs_to :instructor

  has_many :groups, dependent: :destroy
  has_many :trainees, through: :groups
  has_many :time_slots, dependent: :destroy

  has_one :contract, dependent: :destroy


  enum contract_type: [:undefined, :hourly, :per_head, :gradient]

  def need_to_payed_for_group?(trainee_id)
    Group.where(activity_id: self.id, trainee_id: trainee_id, status: "payed").empty?
  end

  def slots_in_month(month)
    self.time_slots.select {|x| x.start_time.month == month}
  end

  def avg_trainees_in_month(month)
    total = 0
    slots_arr = self.slots_in_month(month)
    slots_arr.each do |slot|
      total += slot.trainees.count
    end

    return total/slots_arr.count
  end

  def monthly_data(month)
    slots_in_month = self.time_slots.select {|x| x.start_time.month == month}
    total_trainees = 0
    slots_in_month.each do |slot|
      total_trainees += slot.trainees.count
    end
    if slots_in_month.count != 0 then avg = total_trainees/slots_in_month.count.to_f else avg = 0 end
    payment_hash = self.contract.calc_payout(slots_in_month)
    return {slots_arr: slots_in_month, trainees_avg: avg, payment: payment_hash}
  end
end
