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
      stage = well.stages.where("properties -> 'number' = '#{stage_hash["Number"]}'").first
      properties = {}
      stage_hash.each do |key, value|
        properties[key.downcase.squish.underscore.tr(" ", "_")] = value if key
      end
      stage ? stage.update_attribute(:properties, properties) : well.stages.create!(number: stage_hash["number"], properties: properties)
    end
  end

  def self.common_attributes(wells)
    attributes = wells.map do |well|
      Stage.common_attributes(well.stages)
    end

    attributes.inject(:'&')
  end
end
