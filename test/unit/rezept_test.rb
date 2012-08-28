# == Schema Information
#
# Table name: rezepts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  zutaten     :text
#  zubereitung :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RezeptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
