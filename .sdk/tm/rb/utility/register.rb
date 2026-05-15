# HanoSnapchatLens SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

HanoSnapchatLensUtility.registrar = ->(u) {
  u.clean = HanoSnapchatLensUtilities::Clean
  u.done = HanoSnapchatLensUtilities::Done
  u.make_error = HanoSnapchatLensUtilities::MakeError
  u.feature_add = HanoSnapchatLensUtilities::FeatureAdd
  u.feature_hook = HanoSnapchatLensUtilities::FeatureHook
  u.feature_init = HanoSnapchatLensUtilities::FeatureInit
  u.fetcher = HanoSnapchatLensUtilities::Fetcher
  u.make_fetch_def = HanoSnapchatLensUtilities::MakeFetchDef
  u.make_context = HanoSnapchatLensUtilities::MakeContext
  u.make_options = HanoSnapchatLensUtilities::MakeOptions
  u.make_request = HanoSnapchatLensUtilities::MakeRequest
  u.make_response = HanoSnapchatLensUtilities::MakeResponse
  u.make_result = HanoSnapchatLensUtilities::MakeResult
  u.make_point = HanoSnapchatLensUtilities::MakePoint
  u.make_spec = HanoSnapchatLensUtilities::MakeSpec
  u.make_url = HanoSnapchatLensUtilities::MakeUrl
  u.param = HanoSnapchatLensUtilities::Param
  u.prepare_auth = HanoSnapchatLensUtilities::PrepareAuth
  u.prepare_body = HanoSnapchatLensUtilities::PrepareBody
  u.prepare_headers = HanoSnapchatLensUtilities::PrepareHeaders
  u.prepare_method = HanoSnapchatLensUtilities::PrepareMethod
  u.prepare_params = HanoSnapchatLensUtilities::PrepareParams
  u.prepare_path = HanoSnapchatLensUtilities::PreparePath
  u.prepare_query = HanoSnapchatLensUtilities::PrepareQuery
  u.result_basic = HanoSnapchatLensUtilities::ResultBasic
  u.result_body = HanoSnapchatLensUtilities::ResultBody
  u.result_headers = HanoSnapchatLensUtilities::ResultHeaders
  u.transform_request = HanoSnapchatLensUtilities::TransformRequest
  u.transform_response = HanoSnapchatLensUtilities::TransformResponse
}
