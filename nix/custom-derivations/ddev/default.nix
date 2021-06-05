{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.16.7/ddev_linux-amd64.v1.16.7.tar.gz";
        sha256 = "1ah0rd0s48h4f6avfsbrgn917w91f9a46h0j186j82s0cw5p5vvm";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
