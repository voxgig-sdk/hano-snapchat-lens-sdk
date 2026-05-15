package core

type HanoSnapchatLensError struct {
	IsHanoSnapchatLensError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewHanoSnapchatLensError(code string, msg string, ctx *Context) *HanoSnapchatLensError {
	return &HanoSnapchatLensError{
		IsHanoSnapchatLensError: true,
		Sdk:              "HanoSnapchatLens",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *HanoSnapchatLensError) Error() string {
	return e.Msg
}
