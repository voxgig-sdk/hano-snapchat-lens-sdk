-- HanoSnapchatLens SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "HanoSnapchatLens",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
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
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "description",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "features",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "lens_id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "lens_name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "locale",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "share_url",
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
                ["parts"] = {
                  "6c47a532fd034b93a4aa64b706cf0610",
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
