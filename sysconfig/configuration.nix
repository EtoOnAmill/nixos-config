# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # firmware
  hardware.enableRedistributableFirmware = true;

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 50;
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];

  # Enable networking
  #networking.networkmanager.enable = true;
  networking.hostName = "LinuxAle"; # Define your hostname.
  networking.wireless = {
    enable = true;  # Enables wireless support via wpa_supplicant.
    userControlled.enable = true;
    environmentFile = "/etc/nixos/wireless.env";
    networks = {
      "Redmi Note 9" = {
	psk = "@TEL_PASS@";
	priority = 1;
      };
      "FASTWEB-7JsSy5" = {
	psk = "@HOME_PASS@";
	priority = 2;
      };
      "FASTWEB-VG" = {
	psk = "@HOME_PASS@";
	priority = 3;
      };
    };
  };
  networking.extraHosts = 
  ''
    127.0.0.1 localhost
  '';

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure X11
  services.xserver = {
    xkb.layout = "it";
    xkb.variant = "nodeadkeys";
    xkb.options = "caps:super,caps:none";
    enable = true;
    windowManager.bspwm = {
      enable = true;
      configFile = "/home/etonit/.config/bspwm/bspwmrc";
    };
    displayManager = {
      defaultSession = "none+bspwm";
      setupCommands = "${pkgs.ibus}/bin/ibus restart || ${pkgs.ibus}/bin/ibus-daemon -d -r -x";
      lightdm = {
        enable = true;
        greeter.enable = true;
      };
    };
  };
  # Configure console keymap
  console = {
    # keyMap = "it";
    useXkbConfig = true;
  };

  # enable ibus input method
  i18n.inputMethod.enabled = "ibus";
  environment.variables = {
    GTK_IM_MODULES = "ibus";
    QT_IM_MODULES = "ibus";
    XMODIFIERS = "@im=ibus";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # sound settings
  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.etonit = {
    isNormalUser = true;
    description = "etonit";
    extraGroups = [ "networkmanager" "wheel" "audio" "sound" "libvirtd" ];
    packages = with pkgs; [ ];
    useDefaultShell = true;
  };

  programs.zsh.enable = true;#import ./zsh.nix;
  users.defaultUserShell = pkgs.zsh;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.pinentryFlavor = "curses";

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    lf # terminal file manager 
    bspwm
    sxhkd
    pavucontrol # for audio management
    zsh
    rxvt-unicode
    zip
    unzip
    (vim_configurable.customize{
      name = "vim";
      vimrcConfig.customRC = 
      ''
        no <C-S> :e %:p:h<CR>
        set autoindent
        colorscheme slate
        set number
        set relativenumber
        syntax enable
        se expandtab
     '';
     })
  ];

  # helping with shebang scripts, allows programs in path to be found in /bin
  services.envfs.enable = true;

  # virtualizzazione
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;

  # graphics
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

  # nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # nixos settings
  system.autoUpgrade = {
    enable = true;
    randomizedDelaySec = "30min";
    dates = "10:15";
    operation = "boot";
  };
  system.copySystemConfiguration = true;
  system.stateVersion = "23.11"; # Did you read the comment?

}

