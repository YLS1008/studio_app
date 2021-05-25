# frozen_string_literal: true

class Trainee < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :time_slots, through: :enrollments
  has_many :tasks, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :payments, dependent: :destroy

  def full_name
    first + ' ' + last
  end

  def get_international_number
    inter_phone = phone.dup
    inter_phone[0] = ''
    inter_phone = '972' + phone
    inter_phone
  end

  def is_enrolled?(time_slot)
    time_slots.include? time_slot
  end

  def parent
    Trainee.find_by(id: parent_id)
  end

  def get_children_trainees
    Trainee.where(parent_id: id)
  end

  def open_tasks
    Task.where(trainee_id: id, status: 'open')
  end

  def age
    if birthday.nil?
      nil
    else
      now = Time.now.utc.to_date
      now.year - birthday.year - (now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day) ? 0 : 1)
    end
  end

  def payment_status
    Payment.trainee_tickets(id) - (time_slots.reject { |x| x.mother.contract_if_exists.rate_type == 'monthly' }).count
  end

  def enroll_count
    enrolled_slots = time_slots
    name_arr = []

    if !enrolled_slots.empty?
      enrolled_slots.each do |slot|
        activity_name = slot.mother.name
        if name_arr.include? activity_name
          next
        else
          name_arr.push(activity_name)
        end
      end
      occurances_hash = {}
      enrolled_slots.each do |slot|
        activity_name = slot.mother.name
        occurances_hash[activity_name] = 0
      end

      enrolled_slots.each do |slot|
        occurances_hash[slot.mother.name] += 1
      end

      occurances_hash
    else
      { "\xD7\x9C\xD7\x9C\xD7\x90 \xD7\xA8\xD7\x99\xD7\xA9\xD7\x95\xD7\x9D" => "\xD7\x9C\xD7\x9C\xD7\x90 \xD7\xA8\xD7\x99\xD7\xA9\xD7\x95\xD7\x9D" }
    end
  end
end
