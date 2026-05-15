# HanoSnapchatLens SDK feature factory

from feature.base_feature import HanoSnapchatLensBaseFeature
from feature.test_feature import HanoSnapchatLensTestFeature


def _make_feature(name):
    features = {
        "base": lambda: HanoSnapchatLensBaseFeature(),
        "test": lambda: HanoSnapchatLensTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
