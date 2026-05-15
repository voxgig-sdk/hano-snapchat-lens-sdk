<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility: result_headers

class HanoSnapchatLensResultHeaders
{
    public static function call(HanoSnapchatLensContext $ctx): ?HanoSnapchatLensResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
