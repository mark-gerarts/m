{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.16.4/ddev_linux-amd64.v1.16.4.tar.gz";
        sha256 = "1qyr45iiyxf2775wg94imzzr52c3w1sbn6lgvd552hdcyfqh7xi8";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
