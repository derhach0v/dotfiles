return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
  -- {
  --   "Traap/vim-tmux-runner",
  --   enabled = true and os.getenv("TMUX") ~= nil,
  --   event = "VeryLazy",
  --
  --   config = function()
  --     _G.VtrOrientation = "h"
  --     _G.VtrPercentage = 50
  --     _G.VtrClearSequence = ""
  --     _G.VtrClearBeforeSend = 1
  --   end,
  --
  --   -- NOTE: These keybindings are not the defaults vim-tmux-runner defines.
  --   -- They are set here to minimize and or override LazyVim defaults.
  --   keys = {
  --     { "<leader>tC", "<cmd>VtrClearRunner<cr>",                                       "Clear Tmux Runner" },
  --     { "<leader>tF", "<cmd>VtrFocusRunner<cr>",                                       "Focus Tmux Runner" },
  --     { "<leader>tR", "<cmd>VtrReorientRunner<cr>",                                    "Reorient Tmux Runner" },
  --     { "<leader>ta", "<cmd>VtrReattachRunner<cr>",                                    "Reattach Tmux Runner" },
  --     { "<leader>tc", "<cmd>VtrFlushCommand<cr>",                                      "Flush Tmux Runner Command" },
  --     { "<leader>tf", "<cmd>VtrSendFile<cr>",                                          "Send File to Tmux Runner" },
  --     { "<leader>tk", "<cmd>VtrKillRunner<cr>",                                        "Kill Tmux Runner" },
  --     { "<leader>tl", "<cmd>VtrSendLinesToRunner<cr>",                                 "Send Lines to Tmux Runner" },
  --     { "<leader>ts", "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>", "Open Tmux Runner" },
  --     { "<leader>t-", "<cmd>VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>", "Open Tmux Runner" },
  --     { "<leader>tr", "<cmd>VtrResizeRunner<cr>",                                      "Resize Tmux Runner" },
  --   },
  -- },
}
