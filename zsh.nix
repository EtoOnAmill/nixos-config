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
    split-k = "kitty &";
    split-u = "urxvt &";
    lsdisk = "lsblk";
    memory = "df -hT";
    nisp = "nix-shell -p";
    suspend = "systemctl suspend";
    usrc = "vim ~uconf/home.nix";
    usru = "home-manager switch";
    sysc = "vim ~uconf/sysconfig/configuration.nix";
    sysu = "sudo rm /etc/nixos/* && sudo cp ~uconf/sysconfig/* /etc/nixos && sudo nixos-rebuild switch";
    chann-u = "nix-channel --update && sudo nix-channel --update";
    garbage-collect = "sudo nix-collect-garbage -d && nix-collect-garbage -d ";
  };
}
