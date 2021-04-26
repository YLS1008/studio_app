class Trainee < ApplicationRecord

has_many :enrollments
has_many :time_slots, through: :enrollments
has_many :tasks
has_many :conversations

    def refund_ticket
        self.update(ticket: self.ticket + 1)
    end 

    def charge_ticket
        self.update(ticket: self.ticket - 1)
    end

    def full_name
        self.first + ' ' + self.last
    end

    def self.get_id_from_full_name(name)
        name_arr = name.split(' ')
        if name_arr.length == 2
            @trainee = Trainee.where(first: name_arr[0], last: name_arr[1]).first
        elsif name_arr.length == 3
            @trainee = Trainee.where(first: name_arr[0], last: name_arr[1] + ' ' + name_arr[2]).first
        end

        return @trainee.id
    end

    def get_international_number
        inter_phone = self.phone.dup
        inter_phone[0] = ''
        inter_phone = '972' + phone
        return inter_phone
    end

    def is_enrolled?(time_slot)
        self.time_slots.include? time_slot
    end

end
