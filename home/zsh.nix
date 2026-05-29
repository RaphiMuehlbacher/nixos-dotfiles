{ config, pkgs, ... }: 
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;

      styles = let
        c = config.lib.stylix.colors;
      in {
        command = "fg=#${c.base0D}";
        builtin = "fg=#${c.base0D}";
        string = "fg=#${c.base0B}";
        comment = "fg=#${c.base03}";
        keyword = "fg=#${c.base0E}";
        # builtin = "fg=#${c.base0C}";
        error = "fg=#${c.base0D},bold";
      };
    };
  };
}
