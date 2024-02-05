{ pkgs, lib, ... }: {
	enable = true;
	viAlias = true;
	coc.enable = false;
	/*
	extraConfig = ''
		set number
		set relativenumber
		set autoindent
		set nohlsearch
		set tabstop=4
		set shiftwidth=4
		set nowrap
		set textwidth=0
		colorscheme slate
	'';
	*/
	plugins = with pkgs.vimPlugins; [
		lazy-nvim
		nvim-treesitter.withAllGrammars
	];
}
