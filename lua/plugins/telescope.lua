return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')

            require("telescope").setup {
                pickers = {
                    find_files = {
                        hidden = true,
                    }
                },
            }
            require("which-key").register({
                p = {
                    "+project",
                    b = { builtin.buffers, "Find Open Buffer" },
                    f = { builtin.find_files, "Find File" },
                    F = { function() builtin.find_files({ no_ignore = true }) end, "Find All Files" },
                    s = { builtin.live_grep, "Grep" },
                    h = { builtin.oldfiles, "History" }
                },
                c = {
                    D = { builtin.diagnostics, "Diagnostics" },
                },
                t = { builtin.resume, "Resume Last Search" }
            }, { prefix = "<leader>" })
            require("which-key").register({
                ["<C-t>"] = { builtin.resume, "Resume last Search" },
            })
        end
    },
}
