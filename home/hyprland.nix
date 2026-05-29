{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$monitor1" = "Dell Inc. AW2720HFA FVZ6H43";
      "$monitor2" = "Lenovo Group Limited LEN P27h-10 0x33345947";
      "$monitor3" = "Samsung Display Corp. ATNA40CU05-0";

      monitor = [
        "desc:$monitor3,2880x1800@120.0,3968x432,2"
        "desc:$monitor1,1920x1080@239.76,0x42,1.0"
        "desc:$monitor2,2560x1440@59.95,1920x0,1.25"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 9; 
        border_size = 2;
      };

      dwindle = {
        preserve_split = true;
      };

      decoration = {
        rounding = 8;
        
        blur = {
                enabled = true;
                size = 3;
                passes = 1;
                vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      input = {
        kb_layout = "de";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };
      };

      cursor = {
        no_hardware_cursors = true;
      };

      device = [
        {
          name = "roccat-roccat-kain-120-aimo";
          sensitivity=-0.7;
        }
        {
          name="asce1206:00-04f3:3315-touchpad";
          sensitivity=0.1;
        }
      ];

      exec-once = [
        "[workspace 1 silent] kitty"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, T, exec, kitty"
        "$mainMod, R, exec, rofi -show drun -monitor HDMI-A-1"
        "$mainMod, W, killactive"
        "$mainMod, M, exit"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
        
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.02-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "match:class ^(spotify)$, workspace 8"
        "match:class ^(vesktop)$, workspace 9"
        "match:class ^(zen-beta)$, workspace 5"
      ];


      workspace = [
        "1,monitor:desc:$monitor1,default:true"
        "2,monitor:desc:$monitor1"
        "3,monitor:desc:$monitor1"
        "4,monitor:desc:$monitor1"

        "5,monitor:desc:$monitor2,default:true"
        "6,monitor:desc:$monitor2"
        "7,monitor:desc:$monitor2"

        "8,monitor:desc:$monitor3,default:true"
        "9,monitor:desc:$monitor3"
        "10,monitor:desc:$monitor3"
      ];
    };
  };
}

