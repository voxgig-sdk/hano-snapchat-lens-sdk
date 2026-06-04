# HanoSnapchatLens SDK

Not a programmable API — a Snapchat Lens (camera filter) hosted on lens.snapchat.com

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Hano Snapchat Lens

**Hano Snapchat Lens** is not a public web API. It is a [Snapchat Lens](https://www.snapchat.com/lens) — an in-app augmented-reality camera filter that users apply to photos and videos inside the Snapchat mobile app. The `lens.snapchat.com` host serves shareable Lens preview/landing pages, not JSON endpoints.

Lenses are typically built by independent creators using Snap's [Lens Studio](https://ar.snap.com/lens-studio) or Easy Lens tools and distributed through Snapchat. They run client-side on the user's device as AR effects (face filters, world effects, music-synced visuals, etc.) — not as request/response services you can call from code.

If you were looking for a programmable Snapchat developer interface, see Snap's developer site at [kit.snapchat.com](https://kit.snapchat.com) or the [Camera Kit](https://ar.snap.com/camera-kit) SDK; those are separate from this Lens URL.

This entry exists for catalogue completeness — there are no callable endpoints to document.

## Try it

**TypeScript**
```bash
npm install hano-snapchat-lens
```

**Python**
```bash
pip install hano-snapchat-lens-sdk
```

**PHP**
```bash
composer require voxgig/hano-snapchat-lens-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/hano-snapchat-lens-sdk/go
```

**Ruby**
```bash
gem install hano-snapchat-lens-sdk
```

**Lua**
```bash
luarocks install hano-snapchat-lens-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { HanoSnapchatLensSDK } from 'hano-snapchat-lens'

const client = new HanoSnapchatLensSDK({})

// List all lenss
const lenss = await client.Lens().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o hano-snapchat-lens-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "hano-snapchat-lens": {
      "command": "/abs/path/to/hano-snapchat-lens-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Lens** | Represents a single Snapchat Lens (an AR camera filter) reachable via a `lens.snapchat.com` share URL; it is consumed inside the Snapchat app, not via a JSON API. | `/6c47a532fd034b93a4aa64b706cf0610` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from hanosnapchatlens_sdk import HanoSnapchatLensSDK

client = HanoSnapchatLensSDK({})

# List all lenss
lenss, err = client.Lens(None).list(None, None)
```

### PHP

```php
<?php
require_once 'hanosnapchatlens_sdk.php';

$client = new HanoSnapchatLensSDK([]);

// List all lenss
[$lenss, $err] = $client->Lens(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/hano-snapchat-lens-sdk/go"

client := sdk.NewHanoSnapchatLensSDK(map[string]any{})

// List all lenss
lenss, err := client.Lens(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "HanoSnapchatLens_sdk"

client = HanoSnapchatLensSDK.new({})

# List all lenss
lenss, err = client.Lens(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("hano-snapchat-lens_sdk")

local client = sdk.new({})

-- List all lenss
local lenss, err = client:Lens(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = HanoSnapchatLensSDK.test()
const result = await client.Lens().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = HanoSnapchatLensSDK.test(None, None)
result, err = client.Lens(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = HanoSnapchatLensSDK::test(null, null);
[$result, $err] = $client->Lens(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Lens(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = HanoSnapchatLensSDK.test(nil, nil)
result, err = client.Lens(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Lens(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Hano Snapchat Lens

- Upstream: [https://lens.snapchat.com](https://lens.snapchat.com)

- Snapchat Lenses are content within the Snapchat app, governed by [Snap Inc.'s Terms of Service](https://snap.com/en-US/terms).
- Individual Lenses are typically authored by creators (often via [Lens Studio](https://ar.snap.com/lens-studio) or Easy Lens) and remain the property of their creators and/or Snap Inc.
- There is no public, programmable HTTP API associated with this Lens.

---

Generated from the Hano Snapchat Lens OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
