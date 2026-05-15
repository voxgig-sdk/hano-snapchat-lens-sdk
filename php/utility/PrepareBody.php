<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: prepare_body

class HanoSnapchatLensPrepareBody
{
    public static function call(HanoSnapchatLensContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
