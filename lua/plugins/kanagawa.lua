-- lua/plugins/kanagawa.lua
return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		vim.cmd.colorscheme("kanagawa-dragon")
	end
}
