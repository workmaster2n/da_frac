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

class Well < ActiveRecord::Base
  has_many :stages
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      stage_hash = row.to_hash
      well = Well.find_or_create_by(name: stage_hash["Well Name"])
      stage_hash["frac_date"] = Date.strptime(stage_hash["frac_date"], "%m/%d/%y")
      stage = well.stages.where(number: stage_hash["number"]).first
      stage_hash = stage_hash.except("Well Name")
      stage ? stage.update_attributes(stage_hash) : well.stages.create!(stage_hash)
    end
  end

  def self.common_attributes(wells)
    attributes = wells.map do |well|
      Stage.common_attributes(well.stages)
    end

    attributes.inject(:'&')
  end
end
