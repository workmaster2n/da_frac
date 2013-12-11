# == Schema Information
#
# Table name: wells
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :well do
    name "MyString"
    start_date "2013-12-08"
  end
end
