class Trainee < ApplicationRecord

has_many :children, dependent: :destroy
has_many :enrollments, dependent: :destroy
has_many :time_slots, through: :enrollments
has_many :groups, dependent: :destroy
has_many :activities, through: :groups
has_many :tasks, dependent: :destroy
has_many :conversations, dependent: :destroy

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

    def is_child?
        Child.is_child?(self.id)
    end

    def get_parent
        Child.get_parent(self.id)
    end

    def get_children_trainees
        @child_ids = Child.where(trainee_id: self.id).pluck(:child_trainee_id)
        return Trainee.find(@child_ids)
    end

    def open_tasks
        Task.where(trainee_id: self.id, status: "open")
    end

end
