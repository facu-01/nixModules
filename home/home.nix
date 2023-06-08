{ config, pkgs, options, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Terminal config
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  imports = [
    (import "${home-manager}/nixos")
    ./gnome.nix
    ./dev.nix
    ./vscode.nix
  ];

  # Home manager config
  home-manager.users.facu = {
    home.stateVersion = "23.05";

    programs.git = {
      enable = true;
      userName = "Facundo Lucero";
      userEmail = "facundon.lucero@alumnos.frm.utn.edu.ar";

      extraConfig = {
        pull.rebase = "true";
      };

    };

    programs.fish = {
      enable = true;
      shellAliases = {
        config = "code /home/facu/nixModules";
        update = "sudo nixos-rebuild switch -v";
        update-boot = "sudo nixos-rebuild boot -v";
        search = "google-chrome-stable https://search.nixos.org/packages";
      };

    };
  };

  environment.systemPackages = with pkgs; [
    spotify
    libreoffice
    google-chrome
    lm_sensors
    sqlite
    cpu-x
  ];

}
