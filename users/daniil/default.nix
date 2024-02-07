# /etc/nixos/users/daniil/default.nix
{
  lib,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "daniil";
    # homeDirectory = "/home/daniil";
    stateVersion = "23.11";
  };

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    alejandra
    cached-nix-shell
    cachix
    cmake
    coreutils
    docker
    docker-compose
    gnumake
    htop
    jq
    tmux
    unzip
    wget
  ];

  programs = {
    # https://nix-community.github.io/home-manager/options.xhtml
    # see options here for adding additional programs
    home-manager.enable = true;

    bash.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    vscode = {
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.vscode.package
      enable = true;
      # package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        # install extensions here
        # search: https://search.nixos.org/packages?type=packages&query=vscode-extensions
        # Nix stuff
        mkhl.direnv
        jnoortheen.nix-ide

        # js stuff
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
      ];
    };

    tmux = {
      enable = true;
      clock24 = true;
    };
  };
}
