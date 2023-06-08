{ config, pkgs, options, ... }:

{

  environment.systemPackages = with pkgs; [
    rnix-lsp
    nixpkgs-fmt
  ];

  home-manager.users.facu = {
    programs.vscode.enable = true;
    programs.vscode.package = pkgs.vscode;

    programs.vscode.extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      jnoortheen.nix-ide
      gruntfuggly.todo-tree
      vscode-icons-team.vscode-icons
    ];


    programs.vscode.userSettings = {
      "workbench.sideBar.location" = "right";
      "editor.wordWrap" = "on";
      "window.restoreWindows" = "none";
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "editor.codeActionsOnSave" = {
        "source.fixAll" = true;
        "source.organizeImports" = true;
        "source.sortMembers" = true;
      };
      "window.openFilesInNewWindow" = "on";
      "window.openFoldersInNewWindow" = "on";
      "editor.formatOnSave" = true;
      "explorer.confirmDragAndDrop" = false;
      "nix.serverPath" = "rnix-lsp";
      "workbench.iconTheme" = "vscode-icons";
      "window.titleBarStyle" = "custom";
    };
  };

}
