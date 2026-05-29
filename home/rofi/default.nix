{ config, pkgs, lib, stylix, ... }:

let
  c = config.lib.stylix.colors.withHashtag;
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;

    modes = [ "drun" ];

    extraConfig = {
      display-drun = "";
      drun-display-format = "{icon} {name}";
      icon-theme = "Papirus";
      show-icons = true;
    };
    
    theme = {
      "*" = {
        bg = mkLiteral "${c.base00}";
	bg-alt = mkLiteral "${c.base01}";
	highlight = mkLiteral "${c.base0D}";

	fg = mkLiteral "#FFFFFF";
	fg-alt = mkLiteral "${c.base05}";

        border = 0;
	margin = 0;
	padding = 0;
	spacing = 0;
      };

      window = {
	background-color = mkLiteral "@bg";
      	width = mkLiteral "40%";
	padding = 12;
	border = 2;
	border-radius = 12;
	border-color = mkLiteral "@highlight";
      };

      mainbox = {
      	background-color = mkLiteral "@bg";
	children = mkLiteral "[ inputbar, listview ]";
	spacing = 8;
      };

      inputbar = {
        background-color = mkLiteral "@bg-alt";
	border-radius = 8;
	spacing = 8;
	padding = mkLiteral "8 12";
        children = mkLiteral "[ entry ]";
      };

      entry = {
        background-color = mkLiteral "inherit";
	text-color = mkLiteral "@fg";
	padding = 0;
      };

      listview = {
        background-color = mkLiteral "@bg";
	columns = 1;
	lines = 8;
	spacing = 4;
	padding = mkLiteral "8 0";
	border-radius = 8;
      };

      element = {
	background-color = mkLiteral "inherit";
        padding = mkLiteral "8 12";
	border-radius = 6;
	text-color = mkLiteral "@fg-alt";
      };

      "element selected" = {
        background-color = mkLiteral "@highlight";
	text-coler = mkLiteral "@bg";
      };

      element-text = {
        background-color = mkLiteral "inherit";
	text-color = mkLiteral "inherit";
	vertical-align = mkLiteral "0.5";
	highlight = mkLiteral "${c.base02}";
      };

      "element-text selected" = {
        text-color = mkLiteral "@fg";
      };

      element-icon = {
	background-color = mkLiteral "inherit";
        size = 26;
	padding = mkLiteral "0 8 0 0";
      };

      "element-icon selected" = {
        background-color = mkLiteral "inherit";
	text-color = mkLiteral "@bg";
      };
    };
  };
}


