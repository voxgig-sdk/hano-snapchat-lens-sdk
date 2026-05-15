# HanoSnapchatLens SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module HanoSnapchatLensFeatures
  def self.make_feature(name)
    case name
    when "base"
      HanoSnapchatLensBaseFeature.new
    when "test"
      HanoSnapchatLensTestFeature.new
    else
      HanoSnapchatLensBaseFeature.new
    end
  end
end
