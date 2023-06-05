{ config, pkgs, ... }:

{
  imports = [
    ./hardware/laptop.nix
    ./home/home.nix
  ];

}
