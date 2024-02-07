# /etc/nixos/users/default.nix
{home-manager, ...}: {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    # imports default.nix by well.. default
    bh.imports = [./bh];
    daniil.imports = [./daniil];
  };
}
