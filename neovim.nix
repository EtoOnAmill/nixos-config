{ pkgs, ... }: {
	enable = true;
	viAlias = true;
	coc.enable = true;
	coc.settings = {
		"outline.autoWidth" = false;
		"outline.previewMaxWidth" = false;
		"dialog.maxWidth" = 0;
	};
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
	extraLuaConfig = ''
		vim.opt.number = true;
		vim.opt.relativenumber = true;
		vim.opt.autoindent = true;
		vim.opt.mouse = "";
		vim.opt.hlsearch = false;
		vim.opt.tabstop = 4;
		vim.opt.shiftwidth = 4;
		vim.opt.wrap = false;
		vim.cmd.colorscheme("slate");
		vim.opt.textwidth = 0;
		vim.opt.scrolloff = 8;
		vim.opt.formatoptions = "blj";
	'';
	plugins = with pkgs.vimPlugins; [
		LazyVim
		# lazy-nvim
		pkgs.vimPlugins.nvim-treesitter.withAllGrammars
		/*
		pkgs.vimPlugins.ale
		*/
	];
}
