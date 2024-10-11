return {
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			opts.presets.lsp_doc_border = true
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd([[
              setlocal relativenumber
            ]])
					end,
				},
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local lazy_status = require("lazy.status") -- to configure lazy pending updates count

			local colors = {
				blue = "#83a598", -- Gruvbox blue
				green = "#8ec07c", -- Gruvbox green
				violet = "#d3869b", -- Gruvbox violet
				yellow = "#fabd2f", -- Gruvbox yellow
				red = "#fb4934", -- Gruvbox red
				fg = "#a89984", -- Gruvbox foreground (darker)
				bg = nil, -- Fondo transparente
				inactive_bg = nil,
				black = "#282828",
			}

			local my_lualine_theme = {
				normal = {
					a = { bg = colors.blue, fg = colors.black, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				insert = {
					a = { bg = colors.green, fg = colors.black, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				visual = {
					a = { bg = colors.violet, fg = colors.black, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				command = {
					a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				replace = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.bg, fg = colors.fg },
					c = { bg = colors.bg, fg = colors.fg },
				},
				inactive = {
					a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
					b = { bg = colors.inactive_bg, fg = colors.semilightgray },
					c = { bg = colors.inactive_bg, fg = colors.semilightgray },
				},
			}

			-- configure lualine with modified theme
			lualine.setup({
				options = {
					theme = my_lualine_theme,
				},
				sections = {
					lualine_x = {
						{
							lazy_status.updates,
							cond = lazy_status.has_updates,
							color = { fg = "#ff9e64" },
						},
						{ "encoding" },
						{ "fileformat" },
						{ "filetype" },
					},
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "fade",
			timeout = 4000,
			background_colour = "#000000",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[ 
           ██╗ ██████╗  █████╗  ██████╗ ██████╗ ██████╗ ███████╗██╗   ██╗
           ██║██╔═══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔════╝██║   ██║
           ██║██║   ██║███████║██║     ██║   ██║██║  ██║█████╗  ██║   ██║
      ██   ██║██║   ██║██╔══██║██║     ██║   ██║██║  ██║██╔══╝  ╚██╗ ██╔╝
      ╚█████╔╝╚██████╔╝██║  ██║╚██████╗╚██████╔╝██████╔╝███████╗ ╚████╔╝ 
       ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝  ╚═══╝  
                                                                   
      ]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
