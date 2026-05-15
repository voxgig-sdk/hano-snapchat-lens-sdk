package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewLensEntityFunc func(client *HanoSnapchatLensSDK, entopts map[string]any) HanoSnapchatLensEntity

