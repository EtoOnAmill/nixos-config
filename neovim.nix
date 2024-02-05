{ pkgs, ... }: {
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
		vim.keymap.set("n", "<C-E>", ":e %:h", { noremap = true, silent = true } )
	'';
	*/
	plugins = with pkgs.vimPlugins; [
		# LazyVim
		lazy-nvim
		nvim-treesitter.withAllGrammars
	];
}
