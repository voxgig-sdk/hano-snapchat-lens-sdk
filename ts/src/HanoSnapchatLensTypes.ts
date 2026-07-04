// Typed models for the HanoSnapchatLens SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Lens {
  creator?: string
  description?: string
  feature?: any[]
  lens_id?: string
  lens_name?: string
  locale?: string
  share_url?: string
}

export type LensListMatch = Partial<Lens>

