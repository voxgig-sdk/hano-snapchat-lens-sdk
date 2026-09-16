
import { BaseFeature } from './feature/base/BaseFeature'
import { RatelimitFeature } from './feature/ratelimit/RatelimitFeature'
import { RetryFeature } from './feature/retry/RetryFeature'
import { TestFeature } from './feature/test/TestFeature'
import { TimeoutFeature } from './feature/timeout/TimeoutFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   ratelimit: RatelimitFeature,
 retry: RetryFeature,
 test: TestFeature,
 timeout: TimeoutFeature,

}


// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'HanoSnapchatLens',
        slug: "hano-snapchat-lens",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     ratelimit:     {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "optspec": {
        "now": "`$FUNCTION`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 retry:     {
      "options": {
        "active": false,
        "factor": 2,
        "maxDelay": 2000,
        "minDelay": 50,
        "retries": 2,
        "statuses": [
          408,
          425,
          429,
          500,
          502,
          503,
          504
        ]
      },
      "optspec": {
        "jitter": "`$BOOLEAN`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 test:     {
      "options": {
        "active": false
      },
      "optspec": {
        "entity": "`$MAP`",
        "net": "`$MAP`"
      },
      "strict": false,
      "transport": "base"
    },
 timeout:     {
      "options": {
        "active": false,
        "ms": 30000
      },
      "optspec": {
        "clearTimer": "`$FUNCTION`",
        "setTimer": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },

  }


  options = {
    base: "https://lens.snapchat.com",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      lens: {
      },

    }
  }


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
  }
}


const config = new Config()

export {
  config,
  FEATURE_PLUGINS,
}

