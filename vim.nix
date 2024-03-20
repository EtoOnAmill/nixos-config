{
  enable = true;
  defaultEditor = true;
  plugins = [];
  extraConfig = 
  ''
    autocmd BufEnter * source ${builtins.toString ./vimrc}
  '';
}
