{
  programs.nixcord = {
    enable = true;

    vesktop.enable = true;
    discord.enable = false;

    config = {
      frameless = true;
    };
  };
}
