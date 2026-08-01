local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

ls.add_snippets("go", {
    s(
        { trig = "iferr", name = "If Error Return", dscr = "If err != nil return err" },
        fmta(
            [[
            if err != nil {
                return <ret>
            }
            <finally>
            ]],
            {
                ret = i(1, "err"),
                finally = i(0),
            }
        )
    ),
})
