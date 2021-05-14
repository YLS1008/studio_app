class Contract < ApplicationRecord
  belongs_to :activity

  enum rate_type: [:undefined, :hourly, :per_head, :gradient, :monthly]

  def calc_payout(arr)
    payment_hash = {}
    rate = self.rate_type
    case self.rate_type
    when "undefined"
      arr.each do |slot|
        payment_hash[slot.id] = 0
      end
      payment_hash[:total] = "Please define a contract!"

    when "hourly"
      total = 0
      arr.each do |slot|
        payment_hash[slot.id] = self.rate.to_i * slot.duration/60
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "per_head"
      total = 0
      arr.each do |slot|
        payment_hash[slot.id] = self.rate.to_i * slot.trainees.count
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "gradient"
      total = 0
      arr.each do |slot|
        payment_hash[slot.id] = self.gradient_pay(slot.trainees.count)
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "monthly"
      arr.each do |slot|
        payment_hash[slot.id] = 0
      end
      payment_hash[:total] = "TBD"
    end
    return payment_hash
  end

  private
  def gradient_pay(count)
    total = 0
    (1..count).times do |index|
      case index
      when 1..5
        total += 15
      when 6..10
        total += 20
      when 11..inf
        total += 25
      end
      return total
    end
  end
  
end