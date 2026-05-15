# HanoSnapchatLens SDK utility: feature_add
module HanoSnapchatLensUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
