return {
  -- dir = "~/.config/nvim/lua/derhachov/local_plugins/sf.nvim",
  -- branch = "dev",
  "xixiaofinland/sf.nvim",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "stevearc/overseer.nvim",
  },

  config = function()
    require("sf").setup({
      -- Hotkeys and user commands are enabled for these filetypes
      hotkeys_in_filetypes = {
        "apex",
        "xml",
        "cls",
        "Apex",
        "sosl",
        "soql",
        "javascript",
        "html",
      },
      enable_hotkeys = false, -- enable hotkeys and user commands for filetypes defined in `hotkeys_in_filetypes`
      terminal = "overseer",

      term_config = {
        blend = 10,     -- background transparency: 0 is fully opaque; 100 is fully transparent
        dimensions = {
          height = 0.6, -- proportional of the editor height. 0.4 means 40%.
          width = 0.8,  -- proportional of the editor width. 0.8 means 80%.
          x = 0.5,      -- starting position of width. Details in `get_dimension()` in raw_term.lua source code.
          y = 0.9,      -- starting position of height. Details in `get_dimension()` in raw_term.lua source code.
        },
      },

      default_dir = "/force-app/main/default/",

      -- When set to `false`(default), filetypes defined in `hotkeys_in_filetypes` have
      -- hotkeys and user commands enabled.
      -- When set to `true`, hotkeys and user commands are only enabled when the file also
      -- resides in a sf project folder (i.e. has `.forceignore` or `sfdx-project.json` in the root path)
      enable_hotkeys_only_in_sf_project_folder = false,

      auto_display_code_sign = true,

      -- code coverage sign icon colors
      code_sign_highlight = {
        covered = { fg = "#b7f071" },   -- set `fg = ""` to disable this sign icon
        uncovered = { fg = "#f07178" }, -- set `fg = ""` to disable this sign icon
      },

      -- Define what metadata file names to be listed in `list_md_to_retrieve()` (<leader>ml)
      types_to_retrieve = {
        "ApexClass",
        "ApexTrigger",
        "StaticResource",
        "LightningComponentBundle",
      },
    }) -- important to call setup() to init the plugin!
    local Sf = require("sf")
    vim.keymap.set("n", "<leader>Tt", Sf.toggle_term, { desc = "Toggle overseer" })
    vim.keymap.set("n", "<leader>ss", Sf.set_target_org, { desc = "set target_org current workspace" })
    vim.keymap.set("n", "<leader>sf", Sf.fetch_org_list, { desc = "fetch orgs info" })
    vim.keymap.set("n", "<leader>ml", Sf.list_md_to_retrieve, { desc = "metadata listing" })
    vim.keymap.set("n", "<leader>mtl", Sf.list_md_type_to_retrieve, { desc = "metadata-type listing" })
    vim.keymap.set("n", "<leader>sp", Sf.save_and_push, { desc = "save and push current file" })
    vim.keymap.set("n", "<leader>sr", Sf.retrieve, { desc = "retrieve current file" })
    vim.keymap.set("n", "<leader>sOp", Sf.pull_log, { desc = "pull logs from target org" })
    vim.keymap.set("n", "<leader>sOa", Sf.run_anonymous, { desc = "run anonymous apex" })

    vim.keymap.set("n", "<leader>ta", Sf.run_all_tests_in_this_file, { desc = "run all test in this file" })
    vim.keymap.set(
      "n",
      "<leader>tA",
      Sf.run_all_tests_in_this_file_with_coverage,
      { desc = "run all test in this file with coverage" }
    )
    vim.keymap.set("n", "<leader>tt", Sf.run_current_test, { desc = "run current selected test" })
    vim.keymap.set(
      "n",
      "<leader>tT",
      Sf.run_current_test_with_coverage,
      { desc = "run current selected test with coverage" }
    )
    vim.keymap.set("n", "<leader>to", Sf.open_test_select, { desc = "open test select buf" })
    vim.keymap.set("n", "\\c", Sf.toggle_sign, { desc = "toggle signs for code coverage" })
    vim.keymap.set("x", "<leader>sq", Sf.run_highlighted_soql, { buffer = true, desc = "SOQL run highlighted text" })
  end,
}
