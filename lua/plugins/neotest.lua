require("neotest").setup({
    adapters = {
        require("neotest-golang")({
            runner = "gotestsum",
        }),
    },
})
