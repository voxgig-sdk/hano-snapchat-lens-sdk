-- HanoSnapchatLens SDK error

local HanoSnapchatLensError = {}
HanoSnapchatLensError.__index = HanoSnapchatLensError


function HanoSnapchatLensError.new(code, msg, ctx)
  local self = setmetatable({}, HanoSnapchatLensError)
  self.is_sdk_error = true
  self.sdk = "HanoSnapchatLens"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function HanoSnapchatLensError:error()
  return self.msg
end


function HanoSnapchatLensError:__tostring()
  return self.msg
end


return HanoSnapchatLensError
