{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.17.7/ddev_linux-amd64.v1.17.7.tar.gz";
        sha256 = "1rdpiynisf1vvlplbdn9ybjya964a2hwyf8zfy3gpn8rrbwzsqq5";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
