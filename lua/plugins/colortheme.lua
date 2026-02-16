return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local bg_transparent = true

		local function apply_theme()
			require("tokyonight").setup({
				style = "storm", -- storm | moon | night | day
				transparent = bg_transparent,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					functions = {},
					variables = {},
					sidebars = "transparent", -- sidebars like Neo-tree
					floats = "transparent", -- floating windows
					dim_inactive = false,
				},
				cache = true,
			})
			vim.cmd("colorscheme tokyonight")
		end

		apply_theme()

		-- Toggle background transparency
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			apply_theme()
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
