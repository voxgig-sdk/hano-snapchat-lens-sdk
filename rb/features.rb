# HanoSnapchatLens SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module HanoSnapchatLensFeatures
  def self.make_feature(name)
    case name
    when "base"
      HanoSnapchatLensBaseFeature.new
    when "ratelimit"
      HanoSnapchatLensRatelimitFeature.new
    when "retry"
      HanoSnapchatLensRetryFeature.new
    when "test"
      HanoSnapchatLensTestFeature.new
    when "timeout"
      HanoSnapchatLensTimeoutFeature.new
    else
      HanoSnapchatLensBaseFeature.new
    end
  end
end
