{ pkgs ? import <nixpkgs> {} }:

with pkgs;

runCommand "ddev" {
    src = fetchurl {
        url = "https://github.com/drud/ddev/releases/download/v1.18.0/ddev_linux-amd64.v1.18.0.tar.gz";
        sha256 = "1qxm5c68gns4vglmyvrfd71ig3mypzv1qhk4wyys0y4kpfn28f2d";
    };
} ''
    mkdir -p $out/bin
    tar -xzf $src
    cp ddev $out/bin/ddev
''
