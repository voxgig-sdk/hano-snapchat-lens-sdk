# HanoSnapchatLens SDK feature factory

from hanosnapchatlens_sdk.feature.base_feature import HanoSnapchatLensBaseFeature
from hanosnapchatlens_sdk.feature.test_feature import HanoSnapchatLensTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HanoSnapchatLensBaseFeature(),
        "test": lambda: HanoSnapchatLensTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
