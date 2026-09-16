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
        "slug" => "hano-snapchat-lens",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
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
              "short" => "Creator of the lens",
              "type" => "`$STRING`",
            },
            {
              "name" => "description",
              "short" => "Description of the lens features and functionality",
              "type" => "`$STRING`",
            },
            {
              "name" => "features",
              "short" => "List of features provided by the lens",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "lens_id",
              "short" => "Unique identifier for the lens",
              "type" => "`$STRING`",
            },
            {
              "name" => "lens_name",
              "short" => "Name of the lens",
              "type" => "`$STRING`",
            },
            {
              "name" => "locale",
              "short" => "Locale setting for the lens",
              "type" => "`$STRING`",
            },
            {
              "name" => "share_url",
              "short" => "URL for sharing the lens",
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
                  "segments" => [
                    {
                      "lit" => "6c47a532fd034b93a4aa64b706cf0610",
                    },
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
                  "parts" => [
                    "6c47a532fd034b93a4aa64b706cf0610",
                  ],
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
