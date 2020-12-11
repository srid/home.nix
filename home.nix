{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "srid";
  home.homeDirectory = "/home/srid";

  home.packages = with pkgs; [
    tig
    nnn
  ];

  programs = {
    git = {
      enable = true;
      userName = "Sridhar Ratnakumar";
      userEmail = "srid@srid.ca";
    };
    bash = {
      enable = true;
      shellAliases = {
        g = "git";
        t = "tig";
        l = "ls --color=always";
      };
      # Without this, none of the Nix stuff will be on PATH.
      initExtra = ''
        if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
          . ~/.nix-profile/etc/profile.d/nix.sh;
          export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
        fi # added by Nix installer
        '';
    };
    bat.enable = true;
    autojump.enable = true;
    fzf.enable = true;
    jq.enable = true;
    tmux = {
      enable = true;
      # Force tmux to use /tmp for sockets (WSL2 compat)
      secureSocket = false;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
