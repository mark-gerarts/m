{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.21.1/ddev_linux-amd64.v1.21.1.tar.gz";
        sha256 = "1a3faax9gncgr1jl0yg8qs1vil0rx07pkwycyf8xk9vvzi724v19";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
