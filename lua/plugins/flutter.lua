return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
        flutter_path = "/home/h3ad5h0t/Desktop/flutter/bin/flutter",
      })

      -- Aggiungi questa parte per configurare il debugger
      local dap = require("dap")
      dap.adapters.dart = {
        type = "executable",
        command = "dart",
        args = { "--disable-service-auth-codes", "--enable-vm-service=8080" },
      }



      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          program = "${workspaceFolder}/lib/main.dart",
        },
      }
    end,
  },
}
