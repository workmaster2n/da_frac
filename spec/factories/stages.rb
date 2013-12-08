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
