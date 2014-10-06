# This file was generated by go2nix.
{ stdenv, lib, fetchFromGitHub }:

let
  goDeps = [
    {
      root = "github.com/jteeuwen/go-bindata";
      src = fetchFromGitHub {
        owner = "jteeuwen";
        repo = "go-bindata";
        rev = "93b909d1499a38620121b0a5eb43a18f3bccb083";
        sha256 = "1v4jl9lnzy0p4nvjfkh96yy0w181n5mkr0kamh743911gfbpq4sh";
      };
    }
  ];

in

stdenv.mkDerivation rec {
  name = "go-deps";

  buildCommand =
    lib.concatStrings
      (map (dep: ''
              mkdir -p $out/src/`dirname ${dep.root}`
              ln -s ${dep.src} $out/src/${dep.root}
            '') goDeps);
}
