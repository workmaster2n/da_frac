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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stage do
    well_id 1
    frac_date "2013-12-08"
    gpi 1
    gpi2 1
    top_perf 1
    bottom_perf 1
    stage_length 1
    shots 1
  end
end
