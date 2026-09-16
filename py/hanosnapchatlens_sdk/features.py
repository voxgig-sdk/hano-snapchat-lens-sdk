# HanoSnapchatLens SDK feature factory

from hanosnapchatlens_sdk.feature.base_feature import HanoSnapchatLensBaseFeature
from hanosnapchatlens_sdk.feature.ratelimit_feature import HanoSnapchatLensRatelimitFeature
from hanosnapchatlens_sdk.feature.retry_feature import HanoSnapchatLensRetryFeature
from hanosnapchatlens_sdk.feature.test_feature import HanoSnapchatLensTestFeature
from hanosnapchatlens_sdk.feature.timeout_feature import HanoSnapchatLensTimeoutFeature


_FEATURES = {
    "base": lambda: HanoSnapchatLensBaseFeature(),
    "ratelimit": lambda: HanoSnapchatLensRatelimitFeature(),
    "retry": lambda: HanoSnapchatLensRetryFeature(),
    "test": lambda: HanoSnapchatLensTestFeature(),
    "timeout": lambda: HanoSnapchatLensTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
