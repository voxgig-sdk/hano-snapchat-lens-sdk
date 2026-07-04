package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/hano-snapchat-lens-sdk/go"
	"github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/core"

	vs "github.com/voxgig-sdk/hano-snapchat-lens-sdk/go/utility/struct"
)

func TestLensEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Lens(nil)
		if ent == nil {
			t.Fatal("expected non-nil LensEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := lensBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "lens." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set HANOSNAPCHATLENS_TEST_LENS_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		lensRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.lens", setup.data)))
		var lensRef01Data map[string]any
		if len(lensRef01DataRaw) > 0 {
			lensRef01Data = core.ToMapAny(lensRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = lensRef01Data

		// LIST
		lensRef01Ent := client.Lens(nil)
		lensRef01Match := map[string]any{}

		lensRef01ListResult, err := lensRef01Ent.List(lensRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, lensRef01ListOk := lensRef01ListResult.([]any)
		if !lensRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", lensRef01ListResult)
		}

	})
}

func lensBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "lens", "LensTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read lens test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse lens test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"lens01", "lens02", "lens03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("HANOSNAPCHATLENS_TEST_LENS_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"HANOSNAPCHATLENS_TEST_LENS_ENTID": idmap,
		"HANOSNAPCHATLENS_TEST_LIVE":      "FALSE",
		"HANOSNAPCHATLENS_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["HANOSNAPCHATLENS_TEST_LENS_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["HANOSNAPCHATLENS_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewHanoSnapchatLensSDK(core.ToMapAny(mergedOpts))
	}

	live := env["HANOSNAPCHATLENS_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["HANOSNAPCHATLENS_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
