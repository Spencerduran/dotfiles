local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- INFO callout
	s("blockinfo", {
		t({ "> [!INFO]", "> " }),
		i(1, "Information block"),
	}),

	-- NOTE callout
	s("blocknote", {
		t({ "> [!NOTE]", "> " }),
		i(1, "Note block"),
	}),

	-- ABSTRACT/SUMMARY callout
	s("blockabstract", {
		t({ "> [!ABSTRACT]", "> " }),
		i(1, "Abstract/summary block"),
	}),

	s("blocksummary", {
		t({ "> [!SUMMARY]", "> " }),
		i(1, "Summary block"),
	}),

	-- TODO callout
	s("blocktodo", {
		t({ "> [!TODO]", "> " }),
		i(1, "Todo/task block"),
	}),

	-- TIP callout
	s("blocktip", {
		t({ "> [!TIP]", "> " }),
		i(1, "Tip block"),
	}),

	s("blockhint", {
		t({ "> [!HINT]", "> " }),
		i(1, "Hint block"),
	}),

	s("blockimportant", {
		t({ "> [!IMPORTANT]", "> " }),
		i(1, "Important block"),
	}),

	-- SUCCESS callout
	s("blocksuccess", {
		t({ "> [!SUCCESS]", "> " }),
		i(1, "Success block"),
	}),

	s("blockcheck", {
		t({ "> [!CHECK]", "> " }),
		i(1, "Check block"),
	}),

	s("blockdone", {
		t({ "> [!DONE]", "> " }),
		i(1, "Done block"),
	}),

	-- QUESTION callout
	s("blockquestion", {
		t({ "> [!QUESTION]", "> " }),
		i(1, "Question block"),
	}),

	s("blockhelp", {
		t({ "> [!HELP]", "> " }),
		i(1, "Help block"),
	}),

	s("blockfaq", {
		t({ "> [!FAQ]", "> " }),
		i(1, "FAQ block"),
	}),

	-- WARNING callout
	s("blockwarning", {
		t({ "> [!WARNING]", "> " }),
		i(1, "Warning block"),
	}),

	s("blockcaution", {
		t({ "> [!CAUTION]", "> " }),
		i(1, "Caution block"),
	}),

	s("blockattention", {
		t({ "> [!ATTENTION]", "> " }),
		i(1, "Attention block"),
	}),

	-- FAILURE callout
	s("blockfailure", {
		t({ "> [!FAILURE]", "> " }),
		i(1, "Failure block"),
	}),

	s("blockfail", {
		t({ "> [!FAIL]", "> " }),
		i(1, "Fail block"),
	}),

	s("blockmissing", {
		t({ "> [!MISSING]", "> " }),
		i(1, "Missing block"),
	}),

	-- DANGER callout
	s("blockdanger", {
		t({ "> [!DANGER]", "> " }),
		i(1, "Danger block"),
	}),

	s("blockerror", {
		t({ "> [!ERROR]", "> " }),
		i(1, "Error block"),
	}),

	-- BUG callout
	s("blockbug", {
		t({ "> [!BUG]", "> " }),
		i(1, "Bug block"),
	}),

	-- EXAMPLE callout
	s("blockexample", {
		t({ "> [!EXAMPLE]", "> " }),
		i(1, "Example block"),
	}),

	-- QUOTE callout
	s("blockquote", {
		t({ "> [!QUOTE]", "> " }),
		i(1, "Quote block"),
	}),

	s("blockcite", {
		t({ "> [!CITE]", "> " }),
		i(1, "Citation block"),
	}),

	-- Priority symbols
	s("priority-highest", {
		t("🔺"),
	}),

	s("priority-high", {
		t("⏫"),
	}),

	s("priority-medium", {
		t("🔼"),
	}),

	s("priority-low", {
		t("🔽"),
	}),

	s("priority-lowest", {
		t("⏬"),
	}),
}
