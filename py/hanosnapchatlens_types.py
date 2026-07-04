# Typed models for the HanoSnapchatLens SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Lens:
    creator: Optional[str] = None
    description: Optional[str] = None
    feature: Optional[list] = None
    lens_id: Optional[str] = None
    lens_name: Optional[str] = None
    locale: Optional[str] = None
    share_url: Optional[str] = None


@dataclass
class LensListMatch:
    creator: Optional[str] = None
    description: Optional[str] = None
    feature: Optional[list] = None
    lens_id: Optional[str] = None
    lens_name: Optional[str] = None
    locale: Optional[str] = None
    share_url: Optional[str] = None

