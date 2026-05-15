<?php
declare(strict_types=1);

// HanoSnapchatLens SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

HanoSnapchatLensUtility::setRegistrar(function (HanoSnapchatLensUtility $u): void {
    $u->clean = [HanoSnapchatLensClean::class, 'call'];
    $u->done = [HanoSnapchatLensDone::class, 'call'];
    $u->make_error = [HanoSnapchatLensMakeError::class, 'call'];
    $u->feature_add = [HanoSnapchatLensFeatureAdd::class, 'call'];
    $u->feature_hook = [HanoSnapchatLensFeatureHook::class, 'call'];
    $u->feature_init = [HanoSnapchatLensFeatureInit::class, 'call'];
    $u->fetcher = [HanoSnapchatLensFetcher::class, 'call'];
    $u->make_fetch_def = [HanoSnapchatLensMakeFetchDef::class, 'call'];
    $u->make_context = [HanoSnapchatLensMakeContext::class, 'call'];
    $u->make_options = [HanoSnapchatLensMakeOptions::class, 'call'];
    $u->make_request = [HanoSnapchatLensMakeRequest::class, 'call'];
    $u->make_response = [HanoSnapchatLensMakeResponse::class, 'call'];
    $u->make_result = [HanoSnapchatLensMakeResult::class, 'call'];
    $u->make_point = [HanoSnapchatLensMakePoint::class, 'call'];
    $u->make_spec = [HanoSnapchatLensMakeSpec::class, 'call'];
    $u->make_url = [HanoSnapchatLensMakeUrl::class, 'call'];
    $u->param = [HanoSnapchatLensParam::class, 'call'];
    $u->prepare_auth = [HanoSnapchatLensPrepareAuth::class, 'call'];
    $u->prepare_body = [HanoSnapchatLensPrepareBody::class, 'call'];
    $u->prepare_headers = [HanoSnapchatLensPrepareHeaders::class, 'call'];
    $u->prepare_method = [HanoSnapchatLensPrepareMethod::class, 'call'];
    $u->prepare_params = [HanoSnapchatLensPrepareParams::class, 'call'];
    $u->prepare_path = [HanoSnapchatLensPreparePath::class, 'call'];
    $u->prepare_query = [HanoSnapchatLensPrepareQuery::class, 'call'];
    $u->result_basic = [HanoSnapchatLensResultBasic::class, 'call'];
    $u->result_body = [HanoSnapchatLensResultBody::class, 'call'];
    $u->result_headers = [HanoSnapchatLensResultHeaders::class, 'call'];
    $u->transform_request = [HanoSnapchatLensTransformRequest::class, 'call'];
    $u->transform_response = [HanoSnapchatLensTransformResponse::class, 'call'];
});
