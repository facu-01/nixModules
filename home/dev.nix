{ config, pkgs, options, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    postman
    docker-compose
  ];

  virtualisation.docker.enable = true;
  users.users.facu.extraGroups = [ "docker" ];



}
