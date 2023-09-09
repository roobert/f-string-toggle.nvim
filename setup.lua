return {
	"roobert/f-string-toggle.nvim",
	config = function()
		require("f-string-toggle").setup({
			key_binding = "<leader>f",
			key_binding_desc = "Toggle f-string",
		})
	end,
}
