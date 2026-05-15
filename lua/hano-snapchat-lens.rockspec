package = "voxgig-sdk-hano-snapchat-lens"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/hano-snapchat-lens-sdk.git"
}
description = {
  summary = "HanoSnapchatLens SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["hano-snapchat-lens_sdk"] = "hano-snapchat-lens_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
