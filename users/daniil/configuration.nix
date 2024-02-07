# /etc/nixos/users/daniil/configuration.nix
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

  wsl = {
    # https://nix-community.github.io/NixOS-WSL/options.html
    # for a comprehensive list of wsl options
    enable = true;
    defaultUser = "daniil";
    nativeSystemd = true;
    docker-desktop.enable = true;
  };

  # set this to your Windows 11/10 “Device name.” You can find
  # this in the Windows Settings app under System > About.
  networking.hostName = "DANIILA-P53";

  # Enable nix flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "23.11";
}
