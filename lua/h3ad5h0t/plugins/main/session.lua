return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_session_suppress_dirs = { "~/", "~/Music", "~/Documents", "~/Pictures", "~/Downloads" },
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    })
  end,
}
