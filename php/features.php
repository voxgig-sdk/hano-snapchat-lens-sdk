<?php
declare(strict_types=1);

// HanoSnapchatLens SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class HanoSnapchatLensFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new HanoSnapchatLensBaseFeature();
            case "test":
                return new HanoSnapchatLensTestFeature();
            default:
                return new HanoSnapchatLensBaseFeature();
        }
    }
}
