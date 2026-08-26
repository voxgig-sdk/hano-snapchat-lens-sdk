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
            "slug": "hano-snapchat-lens",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
        "transport": "base",
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
            "short": "Creator of the lens",
            "type": "`$STRING`",
          },
          {
            "name": "description",
            "short": "Description of the lens features and functionality",
            "type": "`$STRING`",
          },
          {
            "name": "features",
            "short": "List of features provided by the lens",
            "type": "`$ARRAY`",
          },
          {
            "name": "lens_id",
            "short": "Unique identifier for the lens",
            "type": "`$STRING`",
          },
          {
            "name": "lens_name",
            "short": "Name of the lens",
            "type": "`$STRING`",
          },
          {
            "name": "locale",
            "short": "Locale setting for the lens",
            "type": "`$STRING`",
          },
          {
            "name": "share_url",
            "short": "URL for sharing the lens",
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
