class Trainee < ApplicationRecord

    has_many :children, dependent: :destroy
    has_many :enrollments, dependent: :destroy
    has_many :time_slots, through: :enrollments
    has_many :groups, dependent: :destroy
    has_many :activities, through: :groups
    has_many :tasks, dependent: :destroy
    has_many :conversations, dependent: :destroy
    has_many :payments, dependent: :destroy


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
        if time_slot.mother.contract_if_exists.rate_type == "monthly"
            self.activities.include? time_slot.mother
        else
            self.time_slots.include? time_slot
        end
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

    def age
        if self.birthday.nil?
            return nil
        else
            now = Time.now.utc.to_date
            return now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
        end
    end

    def payment_status
        Payment.trainee_tickets(self.id) - self.time_slots.count
    end

    def interests
        enrolled_slots = self.time_slots
        interests = []
        enrolled_slots.each do |slot|
            interests.push(slot.mother.name)
        end
        unique_interests = interests.uniq

        if unique_interests.length == 1
            return  unique_interests[0]
        elsif unique_interests.length == 0
            return "ללא רישום"
        else
            return "אופציונלי"
        end
    end

    def enroll_count
        enrolled_slots = self.time_slots
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
           
            return occurances_hash
        else
            return {"ללא רישום" => "ללא רישום"}
        end
    end

end
