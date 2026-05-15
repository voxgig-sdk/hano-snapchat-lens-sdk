<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: result_body

class HanoSnapchatLensResultBody
{
    public static function call(HanoSnapchatLensContext $ctx): ?HanoSnapchatLensResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
