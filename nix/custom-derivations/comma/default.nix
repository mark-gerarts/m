{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  # We just fetch comma directly & unaltered from Github. This way we it can be
  # managed with home-manager.
  #
  # @todo: just install comma from packages instead.
  comma = fetchFromGitHub {
      owner  = "Shopify";
      repo   = "comma";
      rev    = "54149dc417819af14ddc0d59216d4add5280ad14";
      sha256 = "1xjyn42w18w2mn16i7xl0dvay60w82ghayan1ia7v1qqr0a0fac9";
  };

in (import comma {})
