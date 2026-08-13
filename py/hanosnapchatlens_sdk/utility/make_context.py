# HanoSnapchatLens SDK utility: make_context

from hanosnapchatlens_sdk.core.context import HanoSnapchatLensContext


def make_context_util(ctxmap, basectx):
    return HanoSnapchatLensContext(ctxmap, basectx)
