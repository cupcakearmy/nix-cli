{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";

  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.oh-my-posh

    pkgs.git
    pkgs.gnutar
    pkgs.btop

    #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.nerd-fonts.jet-brains-mono

  ];

  home.file = {
    ".config/omp/config.yaml".source = ./files/omp/config.yaml;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  home.shellAliases = {
    l = "ls -hal";
    dc = "docker compose";
    rsync = "rsync -az --info=progress2";
    t = "tmux new-session -A -s main";
    e = "nvim";
    hms = "home-manager switch --flake ~/nix#root -b backup";
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      			oh-my-posh init fish --config ~/.config/omp/config.yaml | source
      			'';
  };
  programs.bash = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    extraConfig = ''
      			# switch panes using Alt-arrow without prefix
      			bind -n M-Left select-pane -L
      			bind -n M-Right select-pane -R
      			bind -n M-Up select-pane -U
      			bind -n M-Down select-pane -D

      			# switch panes using jkhl
      			bind h select-pane -L
      			bind l select-pane -R
      			bind j select-pane -U
      			bind k select-pane -D
      			'';
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
  };
}
