
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { HanoSnapchatLensSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await HanoSnapchatLensSDK.test()
    equal(null !== testsdk, true)
  })

})
