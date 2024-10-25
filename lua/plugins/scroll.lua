return {
  {
		'karb94/neoscroll.nvim',
		event = "VeryLazy",
		config = function()
			require('neoscroll').setup({})
		end
  },
  {
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		config = function()
			require('scrollbar').setup({})
		end
	}
}
