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
  ];

  # Home manager config
  home-manager.users.facu = {
    home.stateVersion = "23.05";

    programs.git = {
      enable = true;
      userName = "Facundo Lucero";
      userEmail = "facundon.lucero@alumnos.frm.utn.edu.ar";
    };

    programs.fish = {
      enable = true;
      shellAliases = {
        update = "sudo nixos-rebuild switch";
      };

    };
  };

  environment.systemPackages = with pkgs; [
    rnix-lsp
    nixpkgs-fmt
    spotify
    libreoffice
    google-chrome
    lm_sensors
    sqlite
  ];

}
