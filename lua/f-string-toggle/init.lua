local M = {}

local config = require("f-string-toggle.config")

M.toggle_fstring = function()
	local current_buf = vim.api.nvim_get_current_buf()
	local filetype = vim.api.nvim_get_option_value("filetype", { buf = current_buf })

	if not vim.tbl_contains(config.options.filetypes, filetype) then
		return
	end

	local ts_utils = require("nvim-treesitter.ts_utils")
	local winnr = vim.api.nvim_get_current_win()
	local cursor = vim.api.nvim_win_get_cursor(winnr)
	local node = ts_utils.get_node_at_cursor()

	while (node ~= nil) and (node:type() ~= "string") do
		node = node:parent()
	end

	if node == nil then
		print("f-string-toggle: could not detect string to change!")
		return
	end

	local srow, scol, ecol, erow = ts_utils.get_vim_range({ node:range() })
	vim.fn.setcursorcharpos({ srow, scol })
	local char = vim.api.nvim_get_current_line():sub(scol, scol)
	local is_fstring = (char == "f")

	if is_fstring then
		vim.cmd("normal x")

		-- if cursor is in the same line as text change
		if srow == cursor[1] then
			-- negative offset to cursor
			cursor[2] = cursor[2] - 1
		end
	else
		vim.cmd("normal if")

		-- if cursor is in the same line as text change
		if srow == cursor[1] then
			-- positive offset to cursor
			cursor[2] = cursor[2] + 1
		end
	end

	vim.api.nvim_win_set_cursor(winnr, cursor)
end

function M.setup(options)
	if options == nil then
		options = {}
	end

	-- merge user supplied options with defaults..
	for k, v in pairs(options) do
		config.options[k] = v
	end

  if config.options["key_binding"] then
    vim.keymap.set(
      "n",
      config.options["key_binding"],
      function() require('f-string-toggle').toggle_fstring() end,
      { silent = true, desc = config.options["key_binding_desc"] }
    )
  end
end

return M
