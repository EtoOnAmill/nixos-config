{
  enable = true;
  defaultEditor = true;
  plugins = [];
  extraConfig = 
  ''
    autocmd BufReadPost * source ${builtins.toString ./vimrc}
  '';
}
