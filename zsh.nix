{
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;

  # plugin managers
  # antidote.enable = true;
  # zplug.enable = true;

  # cd to a dir if it's the only input
  autocd = true;

  # comands to run when completion is enabled
  completionInit = ''
    autoload -U compinit && compinit
  '';

  #keymap of vi
  defaultKeymap = "viins";

  dirHashes = {
    sconf = "/etc/nixos";
    uconf = "$HOME/.config/home-manager";
  };
  history = {
    size = 10000;
    save = 10000;
    ignorePatterns = [ 
      "ls" 
      "cd" 
      "ll" 
      "la" 
    ];
    ignoreAllDups = true;
    ignoreSpace = true;
  };
  historySubstringSearch.enable = true;
  # variables at top of .zshrc
  localVariables = {};
  # comands to run when starting a session
  initExtra = ''
    unsetopt BEEP
    xset -b
  '';
  # comands to run first when starting a session
  initExtraFirst = ''
  '';
  # variables for the zsh session
  sessionVariables = {
    GCM_CREDENTIAL_STORE = "gpg";
  };
  shellAliases = {
    ll = "ls -hl";
    la = "ls -hla";
	lsdisk = "lsblk";
	memory = "df -hT";
    nv= "nvim";
    suspend = "systemctl suspend";
    sysc = "sudo vim ~sconf/configuration.nix";
    usrc = "vim ~uconf/home.nix";
    sysu = "sudo nixos-rebuild switch";
    usru = "home-manager switch";
  };
}
