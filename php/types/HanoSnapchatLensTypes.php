<?php
declare(strict_types=1);

// Typed models for the HanoSnapchatLens SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Lens entity data model. */
class Lens
{
    public ?string $creator = null;
    public ?string $description = null;
    public ?array $feature = null;
    public ?string $lens_id = null;
    public ?string $lens_name = null;
    public ?string $locale = null;
    public ?string $share_url = null;
}

/** Match filter for Lens#list (any subset of Lens fields). */
class LensListMatch
{
    public ?string $creator = null;
    public ?string $description = null;
    public ?array $feature = null;
    public ?string $lens_id = null;
    public ?string $lens_name = null;
    public ?string $locale = null;
    public ?string $share_url = null;
}

