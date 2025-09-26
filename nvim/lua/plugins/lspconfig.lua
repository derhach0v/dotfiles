return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = { ensure_installed = { "prettier", "prettierd" } },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      local mlspconfig = require("mason-lspconfig")
      mlspconfig.setup({
        ensure_installed = { "tailwindcss", "apex_ls", "ts_ls", "markdown_oxide" },
      })
      local lspconfig = require("lspconfig")
      lspconfig.apex_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.ts_ls.setup({})
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local breadcrumb = require("breadcrumb")
      -- local apex_jar_path = vim.fn.stdpath("config") .. "/lspserver" .. "apex-jorje-lsp.jar"
      vim.keymap.set(
        "n",
        "<leader>p",
        require("telescope.builtin").lsp_document_symbols,
        { desc = "LSP: Document Symbols" }
      )

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_command([[augroup Format]])
          vim.api.nvim_command([[autocmd! * <buffer>]])
          vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
          vim.api.nvim_command([[augroup END]])
        end
        if client.server_capabilities.documentSymbolProvider then
          breadcrumb.attach(client, bufnr)
        end
      end

      lspconfig.apex_ls.setup({
        -- apex_jar_path = apex_jar_path,
        cmd = {
          "java",
          "-jar",
          "/Users/denysderhachov/.config/nvim/lspserver/apex-jorje-lsp.jar",
          "apex_language_server",
        },
        on_attach = on_attach,
        capabilities = capabilities,
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false,
        filetypes = { "apex", "apexcode" },
      })
      -- lspconfig.apexlsp.setup({
      --   cmd = { "/usr/bin/java" },
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   filetypes = { "apex", "apexcode" },
      -- })

      lspconfig.markdown_oxide.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "markdown-oxide", "--stdio" },
        filetypes = { "markdown" },
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        cmd = { "typescript-language-server", "--stdio" },
      })

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })

      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        sing_file_support = true,
      })

      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        sing_file_support = true,
        settings = {
          css = {
            validate = true,
          },
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
    end,
  },
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets", "allaman/emoji.nvim", "saghen/blink.compat" },

    -- use a release tag to download pre-built binaries
    version = "*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = "enter",
        -- ["<CR>"] = { "select_and_accept" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-space>"] = {
          function(cmp)
            cmp.show()
          end,
        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        per_filetype = {
          markdown = { "lsp", "path", "snippets", "buffer", "copilot", "emoji" },
        },
        min_keyword_length = function(ctx)
          -- only applies when typing a command, doesn't apply to arguments
          if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
            return 3
          end
          return 0
        end,
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            -- overwrite kind of suggestion
            transform_items = function(ctx, items)
              local kind = require("blink.cmp.types").CompletionItemKind.Text
              for i = 1, #items do
                items[i].kind = kind
              end
              return items
            end,
          },
        },
        -- cmdline = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   -- Commands
        --   if type == ":" or type == "@" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end,
      },
      cmdline = {
        enabled = true,
        keymap = nil, -- Inherits from top level `keymap` config when not set
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          menu = {
            auto_show = nil, -- Inherits from top level `completion.menu.auto_show` config when not set
            draw = {
              columns = { { "label", "label_description", gap = 3 } },
            },
          },
        },
      },
      completion = {
        menu = {
          border = "single",
          draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } } },
        },
        documentation = { window = { border = "single" } },
        ghost_text = {
          enabled = true,
        },
      },
      signature = { window = { border = "single" } },
    },
    opts_extend = { "sources.default" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-cmdline" },
    config = function()
      vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#222436" })
      vim.api.nvim_set_hl(0, "CmpNormalSelect", { bg = "#82aaff" })
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,CursorLine:CmpNormalSelect",
          }),
          documentation = cmp.config.window.bordered({
            border = "single",
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal",
          }),
          completeopt = "menu,menuone, noisert",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
          expandable_indicator = true,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "copilot" },
          { name = "obsidian" },
          { name = "buffer" },
          { name = "path" },
        }),
        snippet = {
          expand = function(args)
            local luasnip = require("luasnip")
            luasnip.lsp_expand(args.body)
          end,
        },
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ["<Down>"] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
          ["<Up>"] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        }),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
