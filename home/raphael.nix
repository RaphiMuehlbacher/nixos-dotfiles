{ config, pkgs, inputs, ...}:

{
  home.username = "raphael";
  home.homeDirectory = "/home/raphael";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
      overskride
      jetbrains-toolbox
      gum
  ];

  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord
    inputs.nixvim.homeModules.nixvim
    ./hyprland.nix
    ./rofi
    ./zen.nix
    ./kitty.nix
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./nixcord.nix
    ./spicetify.nix
    ./nixvim.nix
    ./cli.nix
    ./tmux.nix
  ];
}

