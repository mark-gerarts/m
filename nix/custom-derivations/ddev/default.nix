{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.19.3/ddev_linux-amd64.v1.19.3.tar.gz";
        sha256 = "1zsfycfbh1a3g09x7i71ha0skkcd4nnlxvabjmrzy55q780p29m2";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
