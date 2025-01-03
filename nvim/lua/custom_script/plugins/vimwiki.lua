return {
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					vimwiki_listsyms = "✗○◐●✓",
					path = "~/repos/VimWiki/",
					syntax = "default",
					ext = ".wiki",
					template_path = "~/wiki/templates/",
					template_default = "default_tmp",
					template_ext = ".html",
					auto_toc = 1,
				},
				{
					path = "~/repos/wiki_MonsterLG",
					syntax = "default",
					ext = ".wiki",
				},
			}
		end,
	},
}
