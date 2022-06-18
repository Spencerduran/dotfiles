-- when there is no buffer left show Startify
vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre",
	group = "alpha_on_empty",
	callback = function(event)
		local found_non_empty_buffer = false
		local buffers = M.get_listed_buffers()

		for _, bufnr in ipairs(buffers) do
			if not found_non_empty_buffer then
				local name = vim.api.nvim_buf_get_name(bufnr)
				local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

				if bufnr ~= event.buf and name ~= "" and ft ~= "Alpha" then
					found_non_empty_buffer = true
				end
			end
		end

		if not found_non_empty_buffer then
			vim.cmd([[:Startify]])
		end
	end,
})
