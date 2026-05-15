# HanoSnapchatLens SDK configuration


def make_config():
    return {
        "main": {
            "name": "HanoSnapchatLens",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://lens.snapchat.com",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "lens": {},
            },
        },
        "entity": {
      "lens": {
        "fields": [
          {
            "name": "creator",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "feature",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "lens_id",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "lens_name",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "locale",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "share_url",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 6,
          },
        ],
        "name": "lens",
        "op": {
          "list": {
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
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "example": "fYLE8bhrBH8",
                      "kind": "query",
                      "name": "share_id",
                      "orig": "share_id",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/6c47a532fd034b93a4aa64b706cf0610",
                "parts": [
                  "6c47a532fd034b93a4aa64b706cf0610",
                ],
                "select": {
                  "exist": [
                    "locale",
                    "share_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
