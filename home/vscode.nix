{ config, pkgs, options, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
  ];


  home-manager.users.facu = {
    programs.vscode.userSettings = { };
  };

}
