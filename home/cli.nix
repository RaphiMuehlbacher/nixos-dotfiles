{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gum
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    zoxide.enable = true;
    delta.enable = true;
    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };
    sesh = {
      enable = true;
      enableAlias = false;
      enableTmuxIntegration = false;
    };
  };
}
