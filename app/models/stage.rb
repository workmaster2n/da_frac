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

class Stage < ActiveRecord::Base
  belongs_to :well

  def self.common_attributes(stages)
    attributes = stages.map do |stage|
      stage.attributes.keys
    end

    attributes.inject(:'&')
  end
end
