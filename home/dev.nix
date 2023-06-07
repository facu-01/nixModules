{ config, pkgs, options, ... }:

{
  environment.systemPackages = with pkgs; [
    postman
    docker-compose
  ];

  virtualisation.docker.enable = true;
  users.users.facu.extraGroups = [ "docker" ];



}
