<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class HanoSnapchatLensMakeContext
{
    public static function call(array $ctxmap, ?HanoSnapchatLensContext $basectx): HanoSnapchatLensContext
    {
        return new HanoSnapchatLensContext($ctxmap, $basectx);
    }
}
