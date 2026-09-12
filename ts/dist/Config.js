"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'HanoSnapchatLens',
        slug: "hano-snapchat-lens",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://lens.snapchat.com",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            lens: {},
        }
    };
    entity = {
        "lens": {
            "fields": [
                {
                    "name": "creator",
                    "short": "Creator of the lens",
                    "type": "`$STRING`"
                },
                {
                    "name": "description",
                    "short": "Description of the lens features and functionality",
                    "type": "`$STRING`"
                },
                {
                    "name": "features",
                    "short": "List of features provided by the lens",
                    "type": "`$ARRAY`"
                },
                {
                    "name": "lens_id",
                    "short": "Unique identifier for the lens",
                    "type": "`$STRING`"
                },
                {
                    "name": "lens_name",
                    "short": "Name of the lens",
                    "type": "`$STRING`"
                },
                {
                    "name": "locale",
                    "short": "Locale setting for the lens",
                    "type": "`$STRING`"
                },
                {
                    "name": "share_url",
                    "short": "URL for sharing the lens",
                    "type": "`$STRING`"
                }
            ],
            "name": "lens",
            "op": {
                "list": {
                    "input": "data",
                    "name": "list",
                    "points": [
                        {
                            "args": {
                                "query": [
                                    {
                                        "example": "en-US",
                                        "kind": "query",
                                        "name": "locale",
                                        "orig": "locale",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "example": "fYLE8bhrBH8",
                                        "kind": "query",
                                        "name": "share_id",
                                        "orig": "share_id",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/6c47a532fd034b93a4aa64b706cf0610",
                            "segments": [
                                {
                                    "lit": "6c47a532fd034b93a4aa64b706cf0610"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "locale",
                                    "share_id"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.features`"
                            },
                            "parts": [
                                "6c47a532fd034b93a4aa64b706cf0610"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map