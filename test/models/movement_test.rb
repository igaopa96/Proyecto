# == Schema Information
#
# Table name: movements
#
#  id          :integer          not null, primary key
#  descripcion :string
#  cantidad    :decimal(, )
#  account_id  :integer          not null
#  concept_id  :integer          not null
#  user_id     :integer          not null
#  goal_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class MovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
