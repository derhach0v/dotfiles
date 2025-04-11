return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information",
        },
        opts = { skip = true },
      })
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "sf.nvim",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_buffer_icons = false,
      },
    },
  },
  {
    "grapp-dev/nui-components.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      filetype = {
        cls = { glyph = "󰢎 ", hl = "MiniIconsBlue" },
        cmp = { glyph = " ", hl = "MiniIconsRed" },
        page = { glyph = " ", hl = "MiniIconsRed" },
        design = { glyph = " ", hl = "MiniIconsRed" },
        trigger = { glyph = "󰢎 ", hl = "MiniIconsBlue" },
        apex = { glyph = "󰢎 ", hl = "MiniIconsBlue" },
      },
    },
  },
}
