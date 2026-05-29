{ inputs, pkgs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser.enable = true;
  stylix.targets.zen-browser.enable = false;

  programs.zen-browser.profiles.default = {
    settings = {
      "zen.glance.enabled" = false;
      "zen.urlbar.behavior" = "float";
      "zen.tabs.show-newtab-vertical" = false;

      "theme.better_find_bar.vertical_position" = "top";
      "theme.better_find_bar.instant_animations" = true;
      "theme.better_find_bar.hide_match_diacritics" = "hide_immediately";
      "mod.lean.top-workspace" = true;
      "uc.hidecontext.separators" = true;
      "uc.hidecontext.mutetab" = true;
      "uc.hidecontext.newcontainer" = true;
      "uc.hidecontext.sendtodevice" = true;
      "uc.hidecontext.closetab" = true;
      "uc.hidecontext.askchatbot" = true;
      "uc.hidecontext.search" = true;
      "uc.hidecontext.searchinpriv" = true;
      "uc.hidecontext.translate" = true;
      "uc.hidecontext.printselection" = true;
      "uc.hidecontext.image" = true;
      "uc.hidecontext.audiovideo" = true;
      "uc.hidecontext.checkspelling" = true;
      "uc.hidecontext.duplicatetab" = true;
      "uc.hidecontext.unloadactions" = true;
      "uc.hidecontext.inspect" = true;
      "uc.hidecontext.savelink" = true;
      "uc.hidecontext.screenshot" = true;
      "uc.hidecontext.frame" = true;
      "uc.hidecontext.bookmark" = true;
    };

    mods = [
      "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
      "5bb07b6e-c89f-4f4a-a0ed-e483cc535594" # Custom MenuButton
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "81fcd6b3-f014-4796-988f-6c3cb3874db8" # Zen Context Menu
      "1e86cf37-a127-4f24-b919-d265b5ce29a0" # Lean
      "4c2bec61-7f6c-4e5c-bdc6-c9ad1aba1827" # Vertical Split Tab Groups
      "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
      "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
      "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
    ]; pins = {
      "Twitch" = {
        id = "b4aff22a-750e-4572-a994-aabaa0175e44";
        url = "https://twitch.tv/";
        isEssential = true;
        position = 101;
      };
      "Youtube" = {
        id = "4dc38aa5-2b04-4d5e-afa6-0266110e9931";
        url = "https://youtube.com/";
        isEssential = true;
        position = 102;
      };
    };

    keyboardShortcuts = [
      {
        id = "zen-compact-mode-show-sidebar";
        disabled = true;
      }
    ];
    keyboardShortcutsVersion = 16;
  };
}
