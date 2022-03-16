{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.19.0/ddev_linux-amd64.v1.19.0.tar.gz";
        sha256 = "0hlj7hmm3vyx39fs6fy4921r7p3lp4yvb2vgps655r07b80q9v8p";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
