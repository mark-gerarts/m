{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.19.1/ddev_linux-amd64.v1.19.1.tar.gz";
        sha256 = "17jldmgn12clmmp0vf1kxbsn42lllx38bb8mz7zp013sb2gz2lh0";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
