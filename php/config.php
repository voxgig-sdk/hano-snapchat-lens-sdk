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
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
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
              'type' => '`$STRING`',
            ],
            [
              'name' => 'description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'features',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'lens_id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'lens_name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'locale',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'share_url',
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
                  'parts' => [
                    '6c47a532fd034b93a4aa64b706cf0610',
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
