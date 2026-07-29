require("oil").setup({
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["q"] = { "actions.parent", mode = "n" },
    },
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
            return name == ".."
        end,
    }
})
