{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    prefix = "C-a";

    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";

    disableConfirmationPrompt = true;

    keyMode = "vi";
    customPaneNavigationAndResize = true;

    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-boot 'on'
          set -g @continuum-restore 'on'
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "macchiato"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_window_text " #W"
          set -g @catppuccin_window_current_text " #W"
          # set -g @catppuccin_status_background "none"
        '';
      }
    ];

    extraConfig = ''
      bind-key x kill-pane

      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_directory}"
      set -ag status-right "#{E:@catppuccin_status_session}"

      # keybindings for yank
      set-window-option -g mode-keys vi

      set -g popup-style "bg=default"

      # Open panes in current working directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind-key "K" run-shell "sesh connect \"$(
        sesh list --icons --border-label ' sesh ' | fzf-tmux -p 30%,50% \
        --no-sort --ansi \
        --bind 'tab:down,btab:up'
        --bind 'ctrl-a:change-prompt()+reload(sesh list --icons)' \
        --bind 'ctrl-d:execute(tmux kill-session -t \{2..\})+change-prompt()+reload(sesh list --icons)' \
      )\""

      set-option -g status-position top

      # bind-key "K" display-popup -E -w "40%" "sesh connect \"$(
      #   sesh list -i | gum filter --limit 1 --placeholder \'Pick a sesh\' --prompt=\'⚡\' --no-show-help
      # )\""

    '';
  };
}

