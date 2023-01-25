# == Schema Information
#
# Table name: warranties
#
#  id                :integer          not null, primary key
#  nombre            :string
#  no_identificacion :string
#  fecha_adq         :date
#  estado            :string
#  periodo_dias      :integer
#  dias_restantes    :integer
#  user_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class WarrantyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
