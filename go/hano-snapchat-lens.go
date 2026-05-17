package voxgighanosnapchatlenssdk

import (
	"github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/core"
	"github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/entity"
	"github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/feature"
	_ "github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/utility"
)

// Type aliases preserve external API.
type HanoSnapchatLensSDK = core.HanoSnapchatLensSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type HanoSnapchatLensEntity = core.HanoSnapchatLensEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type HanoSnapchatLensError = core.HanoSnapchatLensError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewLensEntityFunc = func(client *core.HanoSnapchatLensSDK, entopts map[string]any) core.HanoSnapchatLensEntity {
		return entity.NewLensEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewHanoSnapchatLensSDK = core.NewHanoSnapchatLensSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
