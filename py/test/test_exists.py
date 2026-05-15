# ProjectName SDK exists test

import pytest
from hanosnapchatlens_sdk import HanoSnapchatLensSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = HanoSnapchatLensSDK.test(None, None)
        assert testsdk is not None
