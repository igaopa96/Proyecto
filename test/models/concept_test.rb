# == Schema Information
#
# Table name: concepts
#
#  id          :integer          not null, primary key
#  nombre      :string
#  tipo        :integer
#  descripcion :string
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
