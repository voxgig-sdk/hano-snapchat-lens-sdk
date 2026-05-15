
import { Context } from './Context'


class HanoSnapchatLensError extends Error {

  isHanoSnapchatLensError = true

  sdk = 'HanoSnapchatLens'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  HanoSnapchatLensError
}

