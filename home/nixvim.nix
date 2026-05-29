{
  stylix.targets.nixvim.enable = false;
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      updatetime = 200;
      cmdheight = 0;
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        transparent = true;
        style = "storm";
        styles = {
          sidebars = "transparent";
          floats = "transparent";
        };
        on_colors = "function(colors) colors.bg_statusline = colors.none end";
      };
    };

    keymaps = [
      {
        key = "<C-h>";
        action = "<C-w>h";
        mode = "n";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        mode = "n";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        mode = "n";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        mode = "n";
      }
      {
        key = "<leader>ff";
        action.__raw = "function() require('snacks').picker.smart({ hidden = true }) end";
        mode = "n";
      }
      {
        key = "<leader>fd";
        action.__raw = "function() require('snacks').picker.files({ filter = { cwd = true } }) end";
        mode = "n";
      }
      {
        key = "<leader>fg";
        action.__raw = "function() require('snacks').picker.grep() end";
        mode = "n";
      }
      {
        key = "<leader>fu";
        action.__raw = "function() require('snacks').picker.undo() end";
        mode = "n";
      }
    ];

    plugins = {
      rustaceanvim = {
        enable = true;
        settings = {
          server = {
            standalone = false;

            default_settings = {
              rust-analyzer = {
                linkedProjects = [
                  "Cargo.toml"
                  "compiler/rustc_codegen_cranelift/Cargo.toml"
                  "compiler/rustc_codegen_gcc/Cargo.toml"
                  "library/Cargo.toml"
                  "src/bootstrap/Cargo.toml"
                  "src/tools/rust-analyzer/Cargo.toml"
                ];
                server = {
                  extraEnv = {
                    RUSTC = "/home/raphael/personal/projects/rust/build/host/stage0/bin/rustc";
                    CARGO = "/home/raphael/personal/projects/rust/build/host/stage0/bin/cargo";
                  };
                };
                check = {
                  invocationStrategy = "once";  
                  overrideCommand = [  
                    "python3" "x.py" "check" "--json-output" "--build-dir" "build-rust-analyzer"  
                  ];
                };
                rustfmt = {
                  overrideCommand = [ "/home/raphael/personal/projects/rust/build/host/rustfmt/bin/rustfmt" "--edition=2024" ];
                };
                procMacro = {  
                  enable = true;  
                  server = "/home/raphael/personal/projects/rust/build/host/stage0/libexec/rust-analyzer-proc-macro-srv";  
                };
                rustc.source = "./Cargo.toml";
                cargo = {  
                  sysrootSrc = "./library";
                  extraEnv = {  
                    RUSTC_BOOTSTRAP = "1";  
                  };  
                  buildScripts = {  
                    enable = true;  
                    invocationStrategy = "once";  
                    overrideCommand = [  
                      "python3" "x.py" "check" "--json-output" "--compile-time-deps" "--build-dir" "build-rust-analyzer"  
                    ];  
                  };
                };
              };
            };
          };
        };
      };

      nix.enable = true;

      mini-icons = {
        enable = true;
        mockDevIcons = true;
      };

      lualine = {
        enable = true;

        settings.sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            {
              __unkeyed = "filename";
              path = 4;
            }
          ];
          lualine_c = [ "filetype" ];
          lualine_x = [ "" ];
          lualine_y = [ "" ];
          lualine_z = [ "location" ];
        };
      };

      blink-cmp.enable = true;

      snacks = {
        enable = true;
        settings = {
          statuscolumn.enabled = true;
          bigfile.enabled = true;
          image.enabled = true;
          notifier.enabled = true;

          picker = {
            win = {
              input = {
                keys = {
                  "<C-c>" = { __unkeyed = "cancel";  mode = ["n" "i"];  };
                };
              };
              list = {
                keys = {
                  "<C-c>" = { __unkeyed = "cancel";  mode = ["n" "i"];  };
                };
              };
              preview = {
                keys = {
                  "<C-c>" = { __unkeyed = "cancel";  mode = ["n" "i"];  };
                };
              };
            };

            previewers.diff = {
              style = "terminal";
              cmd = [
                "delta"
                "--line-numbers"
                "--hunk-header-style=omit"
                "--width=variable"
              ];
            };
          };
        };
      };

      noice = {
        enable = true;
        settings.presets = {
          command_palette = true;
        };
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };
  };
}
