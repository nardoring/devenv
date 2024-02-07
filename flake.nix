# /etc/nixos/flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixos-wsl,
    nixpkgs-python,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";

    makeUserHost = userName:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./users/common.nix
          ./users/${userName}/configuration.nix
          nixos-wsl.nixosModules.wsl

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userName} = import ./users/${userName};
          }
        ];
      };
  in {
    nixosConfigurations = {
      DESKTOP-G02L8L1 = makeUserHost "adam";
      NB10798 = makeUserHost "bh";
      nixos = makeUserHost "daniil";
    };
  };
}
