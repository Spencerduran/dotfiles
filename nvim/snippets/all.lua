-- luasnip globals
-- defined by snip_env in setup
require("luasnip.loaders.from_lua").lazy_load()
local env = snip_env
return {
	env.parse("gmail", "Spencerduran@gmail.com"),
	env.parse("email", "Spencerduran@gmail.com"),
	env.s("date", env.p(os.date, "%Y-%m-%d")),
	env.s("time", env.p(os.date, "%H:%M")),
--  env.s({ trig = "compare_tables",  name = "SQL compare 2 tables"}, {
--    env.t("with table1 as ("),
--    env.t("select distinct json_extract_scalar(value, '$.LM_char30_30') as Origsys,"),
--    env.t("			json_extract_scalar(value, '$.LM_char30_29') as ListingId"),
--    env.t("		from listing"),
--    env.t("		where source_id in ('S0329') and json_extract_scalar(value, '$.LM_char30_29') <> ''"),
--    env.t("		    and \"date\" >= '2021-05-01'"),
--    env.t(")"),
--    env.t(",table2 as ("),
--    env.t("select distinct json_extract_scalar(value, '$.LM_char30_30') as Origsys,"),
--    env.t("			json_extract_scalar(value, '$.LM_char30_29') as ListingId"),
--    env.t("		from listing"),
--    env.t("		where source_id in ('S0329') and json_extract_scalar(value, '$.LM_char30_29') <> ''"),
--    env.t("		    and \"date\" >= '2021-05-01'"),
--    env.t(")"),
--    env.t("select * from table1 a join table2 b on a.ListingId = b.ListingId and a.Origsys <> b.Origsys"),
--  }),
  --env.s({ trig = "compare_tables",  name = "SQL compare 2 tables"}, {
  --  env.t(with table1 as (
  --    select distinct json_extract_scalar(value, '$.LM_char30_30') as Origsys,
  --    			json_extract_scalar(value, '$.LM_char30_29') as ListingId
  --    		from listing
  --    		where source_id in ('S0329') and json_extract_scalar(value, '$.LM_char30_29') <> ''
  --    		    and "date" >= '2021-05-01'
  --    )
  --    ,table2 as (
  --    select distinct json_extract_scalar(value, '$.LM_char30_30') as Origsys,
  --    			json_extract_scalar(value, '$.LM_char30_29') as ListingId
  --    		from listing
  --    		where source_id in ('S0329') and json_extract_scalar(value, '$.LM_char30_29') <> ''
  --    		    and "date" >= '2021-05-01'
  --    )
  --  select * from table1 a join table2 b on a.ListingId = b.ListingId and a.Origsys <> b.Origsys)
--  }),
	env.s({ trig = "writejson", name = "Write python object to json file" }, {
    t([[import json
        with open(']]),
    i(1, "filename"),
    t(".json', 'w') as outfile:"),
    t([[json.dump(]]),
    i(2, "analysis"),
    t([[, outfile, indent=4, sort_keys=True, default=str)]])
  }),
	env.s({ trig = "hugoimg", name = "Hugo image shortcut" }, {
		env.t("{{< img name="),
		env.i(1, { "name" }),
		env.t(" lazy="),
		env.i(2, { "true" }),
		env.t(" >}}"),
	}),
}

