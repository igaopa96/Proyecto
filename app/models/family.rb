# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  saldo      :decimal(, )
#  nombre     :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Family < ApplicationRecord
  belongs_to :user
  


end
