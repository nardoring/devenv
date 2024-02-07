# /etc/nixos/users/bh/configuration.nix
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
    defaultUser = "bh";
  };

  users.users.bh = {
    group = "users";
    isNormalUser = true;
    extraGroups = ["docker"];
  };

  # set this to your Windows 11/10 “Device name.” You can find
  # this in the Windows Settings app under System > About.
  networking.hostName = "NB10798";
}
