<?php
declare(strict_types=1);

// HanoSnapchatLens SDK configuration

class HanoSnapchatLensConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "HanoSnapchatLens",
                "slug" => "hano-snapchat-lens",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
            ],
            "options" => [
                "base" => "https://lens.snapchat.com",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "lens" => [],
                ],
            ],
            "entity" => [
        'lens' => [
          'fields' => [
            [
              'name' => 'creator',
              'short' => 'Creator of the lens',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'description',
              'short' => 'Description of the lens features and functionality',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'features',
              'short' => 'List of features provided by the lens',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'lens_id',
              'short' => 'Unique identifier for the lens',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'lens_name',
              'short' => 'Name of the lens',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'locale',
              'short' => 'Locale setting for the lens',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'share_url',
              'short' => 'URL for sharing the lens',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'lens',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'example' => 'en-US',
                        'kind' => 'query',
                        'name' => 'locale',
                        'orig' => 'locale',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 'fYLE8bhrBH8',
                        'kind' => 'query',
                        'name' => 'share_id',
                        'orig' => 'share_id',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/6c47a532fd034b93a4aa64b706cf0610',
                  'segments' => [
                    [
                      'lit' => '6c47a532fd034b93a4aa64b706cf0610',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'locale',
                      'share_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.features`',
                  ],
                  'parts' => [
                    '6c47a532fd034b93a4aa64b706cf0610',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return HanoSnapchatLensFeatures::make_feature($name);
    }
}
