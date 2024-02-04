# /etc/nixos/home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # https://github.com/nix-community/nixos-vscode-server
    "${fetchTarball {
      url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
      sha256 = "0sz8njfxn5bw89n6xhlzsbxkafb6qmnszj4qxy2w0hw2mgmjp829";
    }}/modules/vscode-server/home.nix"
  ];

  home = {
    username = "daniil";
    homeDirectory = "/home/daniil";
    stateVersion = "23.11";
  };

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    alejandra
    cached-nix-shell
    cachix
    coreutils
    htop
    docker
    docker-compose
    gnumake
    unzip
    wget
    cmake
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
      userName = "Daniil-Aleshechkin";
      userEmail = "aleshechkin.daniil@gmail.com";
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
  };

  services = {
    vscode-server = {
      enable = true;
      # enableFHS = true; # this allows to install extensions from inside vscode rather than above
      # nodejsPackage = pkgs.nodejs-16_x; # if you need to override node
    };
  };
}
