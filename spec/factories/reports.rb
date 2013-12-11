# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  well_id    :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    well_name "MyString"
    attributes ""
  end
end
