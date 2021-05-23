class Payment < ApplicationRecord
  belongs_to :trainee

  def self.trainee_tickets(id)
    Payment.where(trainee_id: id).sum(&:number_of_tickets)
  end
end
