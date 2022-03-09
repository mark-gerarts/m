{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.18.2/ddev_linux-amd64.v1.18.2.tar.gz";
        sha256 = "1rqx19i8vzbskmm2vrl4za5wi1ym2vgqqkfwsjmyafy9hc2v44f3";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
