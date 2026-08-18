# HanoSnapchatLens SDK configuration

module HanoSnapchatLensConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "HanoSnapchatLens",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://lens.snapchat.com",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "lens" => {},
        },
      },
      "entity" => {
        "lens" => {
          "fields" => [
            {
              "name" => "creator",
              "type" => "`$STRING`",
            },
            {
              "name" => "description",
              "type" => "`$STRING`",
            },
            {
              "name" => "features",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "lens_id",
              "type" => "`$STRING`",
            },
            {
              "name" => "lens_name",
              "type" => "`$STRING`",
            },
            {
              "name" => "locale",
              "type" => "`$STRING`",
            },
            {
              "name" => "share_url",
              "type" => "`$STRING`",
            },
          ],
          "name" => "lens",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => "en-US",
                        "kind" => "query",
                        "name" => "locale",
                        "orig" => "locale",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "fYLE8bhrBH8",
                        "kind" => "query",
                        "name" => "share_id",
                        "orig" => "share_id",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/6c47a532fd034b93a4aa64b706cf0610",
                  "parts" => [
                    "6c47a532fd034b93a4aa64b706cf0610",
                  ],
                  "select" => {
                    "exist" => [
                      "locale",
                      "share_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.features`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    HanoSnapchatLensFeatures.make_feature(name)
  end
end
