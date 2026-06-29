{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages.nix
    ./modules/desktop.nix
    ./modules/services.nix
    ./modules/fonts.nix
    ./modules/nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pc";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas";
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "audio" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
