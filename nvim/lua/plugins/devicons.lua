return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.set_icon({
      cls = {
        icon = "󰢎 ",
        color = "#1798c1",
        name = "cls",
      },
      cmp = {
        icon = " ",
        color = "#e34c26",
        name = "cmp",
      },
      page = {
        icon = " ",
        color = "#e34c26",
        name = "page",
      },
      design = {
        icon = " ",
        color = "#e34c26",
        name = "design",
      },
      trigger = {
        icon = "󰢎 ",
        color = "#1798c1",
        name = "trigger",
      },
    })

    devicons.setup({
      override = {},
      default = true,
    })
  end,
}
