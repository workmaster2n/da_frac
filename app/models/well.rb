class Well < ActiveRecord::Base
  has_many :stages
  require 'CSV'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      stage_hash = row.to_hash
      well = Well.find_or_create_by(name: stage_hash["Well Name"])
      stage = well.stages.where(number: stage_hash["Stage"]).first
      stage_hash = stage_hash.except("Well Name")
      stage ? stage.update_attributes(stage_hash) : well.stages.create!(stage_hash)
    end
  end
end
