class Contract < ApplicationRecord
  belongs_to :activity

  enum rate_type: [:undefined, :hourly, :per_head, :gradient, :monthly]

  def calc_payout(arr)
    byebug
    payment_hash = {}
    rate = self.rate_type
    case self.rate_type
    when "undefined"
      byebug

      arr.each do |slot|
        payment_hash[slot.id] = 0
      end
      payment_hash[:total] = "Please define a contract!"

    when "hourly"
      total = 0
      arr.each do |slot|
        byebug
        payment_hash[slot.id] = self.rate.to_i * slot.duration/60
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "per_head"
      byebug

      total = 0
      arr.each do |slot|
        payment_hash[slot.id] = self.rate.to_i * slot.trainees.count
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "gradient"
      byebug

      total = 0
      arr.each do |slot|
        payment_hash[slot.id] = self.gradient_pay(slot.trainees.count)
        total += payment_hash[slot.id]
      end
      payment_hash[:total] = total

    when "monthly"
      byebug

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
    count.times do |index|
      case index
      when 0..4
        total += 15
      when 5..9
        total += 20
      when 10..100
        total += 25
      end
    end
    return total
  end
  
end
