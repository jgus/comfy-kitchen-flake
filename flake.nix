{
  description = "Fast Kernel Library for ComfyUI with multiple compute backends";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-lib = {
      url = "github:jgus/flake-lib/v1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-lib }:
    flake-lib.lib.mkLeafFlake {
      inherit nixpkgs flake-utils;
      source = { type = "pypi"; pname = "comfy_kitchen"; format = "wheel"; };
      package = {
        attr = "comfy-kitchen";
        description = "Fast Kernel Library for ComfyUI with multiple compute backends";
      };
      pin = import ./pin.nix;
      branches = false;
    };
}
