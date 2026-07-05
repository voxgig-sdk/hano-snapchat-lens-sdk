# frozen_string_literal: true

# Typed models for the HanoSnapchatLens SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Lens entity data model.
#
# @!attribute [rw] creator
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] feature
#   @return [Array, nil]
#
# @!attribute [rw] lens_id
#   @return [String, nil]
#
# @!attribute [rw] lens_name
#   @return [String, nil]
#
# @!attribute [rw] locale
#   @return [String, nil]
#
# @!attribute [rw] share_url
#   @return [String, nil]
Lens = Struct.new(
  :creator,
  :description,
  :feature,
  :lens_id,
  :lens_name,
  :locale,
  :share_url,
  keyword_init: true
)

# Request payload for Lens#list.
#
# @!attribute [rw] creator
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] feature
#   @return [Array, nil]
#
# @!attribute [rw] lens_id
#   @return [String, nil]
#
# @!attribute [rw] lens_name
#   @return [String, nil]
#
# @!attribute [rw] locale
#   @return [String, nil]
#
# @!attribute [rw] share_url
#   @return [String, nil]
LensListMatch = Struct.new(
  :creator,
  :description,
  :feature,
  :lens_id,
  :lens_name,
  :locale,
  :share_url,
  keyword_init: true
)

