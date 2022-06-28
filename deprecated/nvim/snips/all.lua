-- luasnip globals
-- defined by snip_env in setup
require("luasnip.loaders.from_lua").lazy_load()
local env = snip_env

return {
	env.parse("gmail", "Spencerduran@gmail.com"),
	env.parse("email", "Spencerduran@gmail.com"),
	env.s("date", env.p(os.date, "%Y-%m-%d")),
	env.s("time", env.p(os.date, "%H:%M")),
}
