{ stylix, ... }: 
{
  stylix.targets.kitty.enable = false;

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings.background_opacity = "0.8";
  };
}
