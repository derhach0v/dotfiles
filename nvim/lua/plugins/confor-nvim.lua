-- find root of the project
local root = vim.fn.getcwd()

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      prettier = {
        args = function(self, ctx)
          if vim.endswith(ctx.filename, ".cls") then
            return {
              "--stdin-filepath",
              "$FILENAME",
              "--plugin",
              "prettier-plugin-apex",
              "--print-width",
              "300",
              "--use-tabs",
              "true",
              "--tab-width",
              "4",
            }
          elseif vim.endswith(ctx.filename, ".trigger") then
            return {
              "--stdin-filepath",
              "$FILENAME",
              "--plugin",
              "prettier-plugin-apex",
              "--print-width",
              "300",
              "--use-tabs",
              "true",
              "--tab-width",
              "4",
            }
          end
          -- return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
          return { "--stdin-filepath", "$FILENAME" }
        end,
      },
    },
    formatters_by_ft = {
      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettier" },
      ["typescript"] = { "prettier" },
      ["typescriptreact"] = { "prettier" },
      ["vue"] = { "prettier" },
      ["css"] = { "prettier" },
      ["scss"] = { "prettier" },
      ["less"] = { "prettier" },
      ["html"] = { "prettier" },
      ["json"] = { "prettier" },
      ["jsonc"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["markdown"] = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      ["graphql"] = { "prettier" },
      ["handlebars"] = { "prettier" },
      ["apex"] = { "prettier" },
    },
    ext_parsers = {
      apex = "apex",
    },
    default_format_opts = {
      timeout_ms = 3000,
      async = false,           -- not recommended to change
      quiet = false,           -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
  },
}
