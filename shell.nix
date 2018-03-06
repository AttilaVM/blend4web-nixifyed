{ pkgs ? (import <nixpkgs> {}) }:

(import ./default.nix) {
  stdenv            = pkgs.stdenv;
  python36 = pkgs.python36;
  python36Packages = pkgs.python36Packages;
  blender = pkgs.blender;
  nodejs-8_x = pkgs.nodejs-8_x;
  }
