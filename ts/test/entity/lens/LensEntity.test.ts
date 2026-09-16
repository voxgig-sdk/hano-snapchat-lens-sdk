

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { HanoSnapchatLensSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('LensEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when HANO_SNAPCHAT_LENS_TEST_LIVE=TRUE.
  afterEach(liveDelay('HANO_SNAPCHAT_LENS_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = HanoSnapchatLensSDK.test()
    const ent = testsdk.Lens()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.HANO_SNAPCHAT_LENS_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'lens.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"creator","req":false,"short":"Creator of the lens","type":"`$STRING`","index$":0},{"active":true,"name":"description","req":false,"short":"Description of the lens features and functionality","type":"`$STRING`","index$":1},{"active":true,"name":"features","req":false,"short":"List of features provided by the lens","type":"`$ARRAY`","index$":2},{"active":true,"name":"lens_id","req":false,"short":"Unique identifier for the lens","type":"`$STRING`","index$":3},{"active":true,"name":"lens_name","req":false,"short":"Name of the lens","type":"`$STRING`","index$":4},{"active":true,"name":"locale","req":false,"short":"Locale setting for the lens","type":"`$STRING`","index$":5},{"active":true,"name":"share_url","req":false,"short":"URL for sharing the lens","type":"`$STRING`","index$":6}],"name":"lens","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"example":"en-US","kind":"query","name":"locale","orig":"locale","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"example":"fYLE8bhrBH8","kind":"query","name":"share_id","orig":"share_id","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /6c47a532fd034b93a4aa64b706cf0610","json":"{\"operationId\":\"getHanoLens\",\"parameters\":[{\"description\":\"The unique sharing identifier for the lens\",\"in\":\"query\",\"name\":\"share_id\",\"required\":false,\"schema\":{\"example\":\"fYLE8bhrBH8\",\"type\":\"string\"}},{\"description\":\"The locale for the lens display (e.g., en-US)\",\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"default\":\"en-US\",\"example\":\"en-US\",\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"creator\":{\"description\":\"Creator of the lens\",\"example\":\"حنين العزاوي\",\"type\":\"string\"},\"description\":{\"description\":\"Description of the lens features and functionality\",\"type\":\"string\"},\"features\":{\"description\":\"List of features provided by the lens\",\"example\":[\"facial enhancement\",\"artistic filter\",\"makeup effects\"],\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"lens_id\":{\"description\":\"Unique identifier for the lens\",\"example\":\"6c47a532fd034b93a4aa64b706cf0610\",\"type\":\"string\"},\"lens_name\":{\"description\":\"Name of the lens\",\"example\":\"Hano Lens\",\"type\":\"string\"},\"locale\":{\"description\":\"Locale setting for the lens\",\"type\":\"string\"},\"share_url\":{\"description\":\"URL for sharing the lens\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Successfully retrieved Hano Lens details\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Bad request - Invalid parameters provided\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message indicating lens was not found\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Lens not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/6c47a532fd034b93a4aa64b706cf0610","segments":[{"lit":"6c47a532fd034b93a4aa64b706cf0610"}],"select":{"exist":["locale","share_id"]},"transform":{"req":"`reqdata`","res":"`body.features`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"lens","name__orig":"lens","Name":"Lens","name_":"lens","name-":"lens","NAME":"LENS","index$":0}, {"active":true,"entity":"lens","key$":"BasicLensFlow","kind":"basic","name":"BasicLensFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"lens_ref01"}}],"index$":0}]}, 'Lens')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let lens_ref01_data = Object.values(setup.data.existing.lens)[0] as any

    // LIST
    const lens_ref01_ent = client.Lens()
    const lens_ref01_match: any = {}

    const lens_ref01_list = (await lens_ref01_ent.list(lens_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/lens/LensTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = HanoSnapchatLensSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['lens01','lens02','lens03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'HANO_SNAPCHAT_LENS_TEST_LENS_ENTID': idmap,
    'HANO_SNAPCHAT_LENS_TEST_LIVE': 'FALSE',
    'HANO_SNAPCHAT_LENS_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['HANO_SNAPCHAT_LENS_TEST_LENS_ENTID']

  const live = 'TRUE' === env.HANO_SNAPCHAT_LENS_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['HANO_SNAPCHAT_LENS_TEST_LENS_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new HanoSnapchatLensSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.HANO_SNAPCHAT_LENS_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
