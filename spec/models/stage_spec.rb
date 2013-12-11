# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  well_id      :integer
#  frac_date    :date
#  gpi          :integer
#  gpi2         :integer
#  top_perf     :integer
#  bottom_perf  :integer
#  stage_length :integer
#  shots        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  number       :integer
#

require 'spec_helper'

describe Stage do
end
