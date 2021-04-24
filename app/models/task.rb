class Task < ApplicationRecord
  belongs_to :trainee

  enum status: [:open, :on_it, :closed]
end
