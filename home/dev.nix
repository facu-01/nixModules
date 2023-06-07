{ config, pkgs, options, ... }:

{
  environment.systemPackages = with pkgs; [
    postman
    docker-compose
    docker-client
  ];

  virtualisation.docker.enable = true;
  users.users.facu.extraGroups = [ "docker" ];



}
