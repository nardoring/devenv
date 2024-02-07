# /etc/nixos/users/common.nix
# common configuration shared across all hosts and users
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
    nativeSystemd = true;
    docker-desktop.enable = true;
  };

  virtualisation.docker.enable = true;
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
