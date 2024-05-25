local plugins_to_check = {
	"catppuccin",
	"toggleterm",
}

local function get_unloaded_plugins()
	local unloaded = {}
	for _, plugin in ipairs(plugins_to_check) do
		if not package.loaded[plugin] then
			table.insert(unloaded, plugin)
		end
	end
	return unloaded
end

local function show_unloaded_plugins()
	local unloaded_plugins = get_unloaded_plugins()
	if #unloaded_plugins == 0 then
		vim.notify("All plugins are loaded", vim.log.levels.INFO)
		return
	end
	require("telescope.packer")
		.new({}, {
			prompt_title = "Load Plugins",
			finder = require("telescope.finders").new_table({
				results = unloaded_plugins,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry,
						ordinal = entry,
					}
				end,
			}),
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", function()
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					vim.cmd("lua require('" .. selection.value .. "')")
				end)
				return true
			end,
		})
		:find()
end

vim.api.nvim_create_user_command("LoadPlugins", show_unloaded_plugins, {})
