{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "etonit";
  home.homeDirectory = "/home/etonit";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (vim_configurable.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        set autoindent
	set tabstop=4
	set textwidth=0
	set number
	set relativenumber
	set scrolloff=8
	syntax enable
	set formatoptions=bl
	nmap S :e %:p:h<CR>
	colorscheme sorbet
      '';
    })
    # for lazyvim
    ripgrep
    fd
    tree-sitter
    nerdfonts
    xclip
    # terminal
    rxvt-unicode
	kitty
    htop
    zip
    # git
    git-credential-manager
    pinentry
    gnupg
    # audio
    pavucontrol
    audacious
    # gui
    firefox
    bspwm
    sxhkd
    lemonbar
    # util
    gscreenshot
    wpa_supplicant_gui
    virt-manager
    # programming
    zig
    rustup
    gcc
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
    ".config/bspwm" = {
      source = ./bspwm;
      recursive = true;
    };
    ".config/sxhkd" = {
      source = ./sxhkd;
      recursive = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/etonit/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = import ./zsh.nix;
  programs.kitty = import ./kitty.nix;
  programs.urxvt = import ./urxvt.nix;
  programs.neovim = import ./neovim.nix pkgs;
  programs.git = import ./git.nix pkgs;
  programs.lf = import ./lf.nix;
}
