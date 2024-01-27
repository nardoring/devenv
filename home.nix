# /etc/nixos/home.nix
# https://nix-community.github.io/home-manager/options.xhtml
{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "jdoe"; # TODO Set name
    homeDirectory = "/home/jdoe"; # TODO Set name
    stateVersion = "23.11";
  };

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    alejandra
    coreutils
    htop
    gnumake
    git
  ];

  programs = {
    home-manager.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    git = {
      enable = true;
      userName = "Jane Doe";
      userEmail = "jane.doe@example.org";
    };
  };
}
