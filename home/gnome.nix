{ config, pkgs, ... }:


{

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
  ];


  home-manager.users.facu.dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "google-chrome.desktop"
        "org.gnome.Console.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
        "spotify.desktop"
      ];

      disable-user-extensions = false;

      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
      ];
    };
  };

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);


}
