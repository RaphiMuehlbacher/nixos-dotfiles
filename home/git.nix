{
  programs.git = {
    enable = true;
    settings = {
      user.name = "RaphiMuehlbacher";
      user.email = "raphi.muehlbacher@gmail.com";
      core.editor = "nvim";
      pull.rebase = true;
      init.defaultBranch = "main";
    };
  };
}
