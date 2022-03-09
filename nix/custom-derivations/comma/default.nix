{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  # We just fetch comma directly & unaltered from Github. This way we it can be
  # managed with home-manager.
  comma = fetchFromGitHub {
      owner  = "Shopify";
      repo   = "comma";
      rev    = "54149dc417819af14ddc0d59216d4add5280ad14";
      sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
  };

in (import comma {})
