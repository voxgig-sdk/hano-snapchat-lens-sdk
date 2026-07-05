// Typed models for the HanoSnapchatLens SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Lens is the typed data model for the lens entity.
type Lens struct {
	Creator *string `json:"creator,omitempty"`
	Description *string `json:"description,omitempty"`
	Feature *[]any `json:"feature,omitempty"`
	LensId *string `json:"lens_id,omitempty"`
	LensName *string `json:"lens_name,omitempty"`
	Locale *string `json:"locale,omitempty"`
	ShareUrl *string `json:"share_url,omitempty"`
}

// LensListMatch is the typed request payload for Lens.ListTyped.
type LensListMatch struct {
	Creator *string `json:"creator,omitempty"`
	Description *string `json:"description,omitempty"`
	Feature *[]any `json:"feature,omitempty"`
	LensId *string `json:"lens_id,omitempty"`
	LensName *string `json:"lens_name,omitempty"`
	Locale *string `json:"locale,omitempty"`
	ShareUrl *string `json:"share_url,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
