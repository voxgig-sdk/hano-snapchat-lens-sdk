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
            "active": True,
            "name": "creator",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "description",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "feature",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "lens_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "lens_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "locale",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "share_url",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
        ],
        "name": "lens",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "example": "en-US",
                      "kind": "query",
                      "name": "locale",
                      "orig": "locale",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "example": "fYLE8bhrBH8",
                      "kind": "query",
                      "name": "share_id",
                      "orig": "share_id",
                      "reqd": False,
                      "type": "`$STRING`",
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
                "index$": 0,
              },
            ],
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
