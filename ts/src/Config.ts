
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'HanoSnapchatLens',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
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
          "type": "`$STRING`"
        },
        {
          "name": "description",
          "type": "`$STRING`"
        },
        {
          "name": "features",
          "type": "`$ARRAY`"
        },
        {
          "name": "lens_id",
          "type": "`$STRING`"
        },
        {
          "name": "lens_name",
          "type": "`$STRING`"
        },
        {
          "name": "locale",
          "type": "`$STRING`"
        },
        {
          "name": "share_url",
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
              "parts": [
                "6c47a532fd034b93a4aa64b706cf0610"
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
              }
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
  config
}

