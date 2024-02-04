# /etc/nixos/configuration.nix
{
  lib,
  pkgs,
  config,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];

  environment.noXlibs = false;

  wsl = {
    # https://nix-community.github.io/NixOS-WSL/options.html
    # for a comprehensive list of wsl options
    enable = true;
    defaultUser = "daniil";
    nativeSystemd = true;
    docker-desktop.enable = true;
  };
  virtualisation.docker.enable = true;
  users.users.daniil.extraGroups = ["docker"];

  # set this to your Windows 11/10 “Device name.” You can find
  # this in the Windows Settings app under System > About.
  networking.hostName = "nixos"; # TODO Set hostname

  nixpkgs.config.allowUnfree = true;
  
  # Enable nix flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "23.11";
}
