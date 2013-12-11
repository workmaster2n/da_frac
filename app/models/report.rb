# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  well_id    :integer
#

class Report < ActiveRecord::Base
  belongs_to :well
end
