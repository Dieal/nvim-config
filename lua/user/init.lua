local plugins = {
    --"lsp",
    "keymaps",
    "options",
    "plugins",
    "plugin_config.cmp",
    -- "plugin_config.jabs",
    "plugin_config.impatient",
    "plugin_config.colorscheme",
    "plugin_config.whichkey",
    "plugin_config.tree",
}

for key, value in pairs (plugins) do
	require ('user.' .. value)
end
