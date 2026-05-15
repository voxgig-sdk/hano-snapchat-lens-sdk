# HanoSnapchatLens SDK utility: make_context
require_relative '../core/context'
module HanoSnapchatLensUtilities
  MakeContext = ->(ctxmap, basectx) {
    HanoSnapchatLensContext.new(ctxmap, basectx)
  }
end
