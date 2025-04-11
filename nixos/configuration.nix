{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./device-specific-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Brussels";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  # Sound.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.mark = {
    isNormalUser = true;
    description = "Mark";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  programs.firefox.enable = true;

  # Forgive me for my sins, RMS.
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    wget
    git
    delta

    # Dev
    vscode
  ];

  programs.gnupg.agent.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
