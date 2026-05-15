<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: feature_add

class HanoSnapchatLensFeatureAdd
{
    public static function call(HanoSnapchatLensContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
