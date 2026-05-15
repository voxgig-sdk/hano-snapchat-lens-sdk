<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: prepare_headers

class HanoSnapchatLensPrepareHeaders
{
    public static function call(HanoSnapchatLensContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}
