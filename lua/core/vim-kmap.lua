vim.api.nvim_set_keymap("v", "c", '"+y', { noremap = true })

-- Bufferline shortcuts
vim.api.nvim_set_keymap("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>dh", ":Dashboard<CR>", { noremap = true, silent = true })

-- Switch buffers shortcuts
vim.api.nvim_set_keymap("n", "<Tab>1", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>2", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>3", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>4", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>5", "<cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>6", "<cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>7", "<cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>8", "<cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>9", "<cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

-- macro per muovere un file in verticale
vim.api.nvim_set_keymap("n", "<leader>mf", ":vsplit | Telescope find_files<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })

-- shortcuts for opening Trouble map
vim.api.nvim_set_keymap("n", "<leader>e", ":Trouble<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-s>", ":wa<CR>", { noremap = true, silent = true })

-- Lista di tag HTML 
local html_tags = {
    "a", "abbr", "address", "area", "article", "aside", "audio", "b", "base", "bdi", "bdo", "blockquote", "body", "br",
    "button", "canvas", "caption", "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details", "dfn",
    "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "footer", "form", "h1", "h2", "h3",
    "h4", "h5", "h6", "head", "header", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "label", "legend",
    "li", "link", "main", "map", "mark", "meta", "meter", "nav", "noscript", "object", "ol", "optgroup", "option",
    "output", "p", "param", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section",
    "select", "small", "source", "span", "Stack", "strong", "style", "sub", "summary", "sup", "svg", "table", "tbody", "td",
    "template", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "u", "ul", "var", "video", "wbr"
}

-- Definisci la funzione nel contesto globale di Lua
_G.insert_html_tag = function()
    require('telescope.pickers').new({}, {
        prompt_title = "Insert HTML Tag",
        finder = require('telescope.finders').new_table({
            results = html_tags,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        }),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            require('telescope.actions').select_default:replace(function()
                local selection = require('telescope.actions.state').get_selected_entry()
                require('telescope.actions').close(prompt_bufnr)
                local tagText = string.format('<%s></%s>', selection.value, selection.value)
                vim.api.nvim_put({tagText}, 'c', true, true)
                vim.api.nvim_feedkeys("T><i", "n", true)
            end)
            return true
        end
    }):find()
end

