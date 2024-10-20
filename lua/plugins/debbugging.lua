return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"NicholasMata/nvim-dap-cs",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap-python",
		"mfussenegger/nvim-jdtls",
        "julianolf/nvim-dap-lldb"
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("mason-nvim-dap").setup()

		require("dapui").setup()
		require("dap-cs").setup()
		require("dap-python").setup("python")

        require("dap-lldb").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
