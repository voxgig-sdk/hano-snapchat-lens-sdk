package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "HanoSnapchatLens",
			"slug": "hano-snapchat-lens",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://lens.snapchat.com",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"lens": map[string]any{},
			},
		},
		"entity": map[string]any{
			"lens": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "creator",
						"short": "Creator of the lens",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "description",
						"short": "Description of the lens features and functionality",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "features",
						"short": "List of features provided by the lens",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "lens_id",
						"short": "Unique identifier for the lens",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "lens_name",
						"short": "Name of the lens",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "locale",
						"short": "Locale setting for the lens",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "share_url",
						"short": "URL for sharing the lens",
						"type": "`$STRING`",
					},
				},
				"name": "lens",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "en-US",
											"kind": "query",
											"name": "locale",
											"orig": "locale",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "fYLE8bhrBH8",
											"kind": "query",
											"name": "share_id",
											"orig": "share_id",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/6c47a532fd034b93a4aa64b706cf0610",
								"parts": []any{
									"6c47a532fd034b93a4aa64b706cf0610",
								},
								"select": map[string]any{
									"exist": []any{
										"locale",
										"share_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.features`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
