# /etc/nixos/home.nix
{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
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
    gnumake
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
      userName = "Daniil-Aleshechkin";
      userEmail = "aleshechkin.daniil@gmail.com";
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
