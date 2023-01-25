# == Schema Information
#
# Table name: accounts
#
#  id            :integer          not null, primary key
#  nombre        :string
#  descripcion   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  saldo         :decimal(, )
#  tipo_cuenta   :integer
#  tipo_familiar :boolean
#  user_id       :integer          not null
#
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
