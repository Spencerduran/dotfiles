return {
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					vimwiki_listsyms = "✗○◐●✓",
					path = "~/repos/vimwiki_MonsterLG",
					syntax = "default",
					ext = ".md",
					template_path = "~/wiki/templates/",
					template_default = "default_tmp",
					template_ext = ".html",
					auto_toc = 1,
				},
				--{
				--	path = "~/repos/wiki_",
				--	syntax = "default",
				--	ext = ".wiki",
				--},
			}
		end,
	},
}
