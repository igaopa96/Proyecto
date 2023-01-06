class Movement < ApplicationRecord
  belongs_to :account
  belongs_to :concept
  belongs_to :user
  belongs_to :goal
end
