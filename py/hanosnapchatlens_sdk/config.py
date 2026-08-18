# HanoSnapchatLens SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
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
            "name": "creator",
            "type": "`$STRING`",
          },
          {
            "name": "description",
            "type": "`$STRING`",
          },
          {
            "name": "features",
            "type": "`$ARRAY`",
          },
          {
            "name": "lens_id",
            "type": "`$STRING`",
          },
          {
            "name": "lens_name",
            "type": "`$STRING`",
          },
          {
            "name": "locale",
            "type": "`$STRING`",
          },
          {
            "name": "share_url",
            "type": "`$STRING`",
          },
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
                      "type": "`$STRING`",
                    },
                    {
                      "example": "fYLE8bhrBH8",
                      "kind": "query",
                      "name": "share_id",
                      "orig": "share_id",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.features`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
