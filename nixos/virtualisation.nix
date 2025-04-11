{ config, lib, pkgs, ...}:

{
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;

      # By default, docker uses oversized network ranges, resulting in less
      # total available networks. We override the default address pools to use
      # smaller ranges, thus creating more possible networks.
      #
      # @see https://straz.to/2021-09-08-docker-address-pools/
      daemon.settings = {
        default-address-pools = [
          {
            base = "172.17.0.0/12";
            size = 20;
          }
          {
            base = "192.168.0.0/16";
            size = 24;
          }
        ];
      };

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

    users.extraGroups.vboxusers.members = [ "mark" ];
}
