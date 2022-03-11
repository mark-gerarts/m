{ config, lib, pkgs, ...}:

{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;

      # The Docker daemon by default alters iptables to allow outside traffic.
      # The Docker documentation states that it is probably not a good idea to
      # disable this, so if things break this might be a good place to start
      # debugging.
      #
      # @see https://github.com/NixOS/nixpkgs/issues/111852
      # @see https://docs.docker.com/network/iptables/#prevent-docker-from-manipulating-iptables
      # extraOptions = ''--iptables=false --ip6tables=false'';
    };

    virtualbox.host.enable = true;
  };
}
