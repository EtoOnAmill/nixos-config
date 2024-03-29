vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.mouse = ""
vim.opt.hlsearch = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = true
vim.cmd.colorscheme("slate")
vim.opt.textwidth = 0
vim.opt.scrolloff = 8
vim.opt.formatoptions = "blj"
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-S>", "<CMD>%s/\\s\\+$//<CR>", {noremap = true, silent = true})
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "source $MYVIMRC",
})

require("oil").setup({
    defaul_file_explorer = true,
    view_options = {
        show_hidden = true,
    }
})

--[[
local function str2obj(str)
	-- this would usually need ("return " .. str)
	-- but it is already included in the files we will iterate over
	return assert(load(str))()
end

pluginDir = "~/.config/home-manager/nvim/plugin/"
plugins = {}

require("io")

filePipe = io.popen("pluginDir=" .. pluginDir .. ";for filename in $(ls $pluginDir); do cat $pluginDir$filename; done")
currFileContent = ""
for fileContent in filePipe:lines() do
	if fileContent == "}" then
		catobj = str2obj(currFileContent .. "}")
		table.insert(plugins, catobj)
		currFileContent = ""
	else
		currFileContent = currFileContent .. fileContent .. "\n"
	end
end

require("lazy").setup(plugins)
--]]
