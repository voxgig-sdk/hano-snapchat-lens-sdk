<?php
declare(strict_types=1);

// HanoSnapchatLens SDK configuration

class HanoSnapchatLensConfig
{
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
                "auth" => [
                    "prefix" => "Bearer",
                ],
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
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'description',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'feature',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 2,
            ],
            [
              'name' => 'lens_id',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 3,
            ],
            [
              'name' => 'lens_name',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 4,
            ],
            [
              'name' => 'locale',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 5,
            ],
            [
              'name' => 'share_url',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 6,
            ],
          ],
          'name' => 'lens',
          'op' => [
            'list' => [
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
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'example' => 'fYLE8bhrBH8',
                        'kind' => 'query',
                        'name' => 'share_id',
                        'orig' => 'share_id',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                    ],
                  ],
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
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'list',
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
