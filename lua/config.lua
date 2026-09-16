-- HanoSnapchatLens SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "HanoSnapchatLens",
      slug = "hano-snapchat-lens",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://lens.snapchat.com",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["lens"] = {},
      },
    },
    entity = {
      ["lens"] = {
        ["fields"] = {
          {
            ["name"] = "creator",
            ["short"] = "Creator of the lens",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "description",
            ["short"] = "Description of the lens features and functionality",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "features",
            ["short"] = "List of features provided by the lens",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "lens_id",
            ["short"] = "Unique identifier for the lens",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "lens_name",
            ["short"] = "Name of the lens",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "locale",
            ["short"] = "Locale setting for the lens",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "share_url",
            ["short"] = "URL for sharing the lens",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "lens",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "en-US",
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "fYLE8bhrBH8",
                      ["kind"] = "query",
                      ["name"] = "share_id",
                      ["orig"] = "share_id",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/6c47a532fd034b93a4aa64b706cf0610",
                ["segments"] = {
                  {
                    ["lit"] = "6c47a532fd034b93a4aa64b706cf0610",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "locale",
                    "share_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.features`",
                },
                ["parts"] = {
                  "6c47a532fd034b93a4aa64b706cf0610",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
