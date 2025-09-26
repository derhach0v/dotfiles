return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    local g = vim.g

    -- only run the linters defined in the ale_linters
    g.ale_linters_explicit = 1

    -- g.ale_apex_pmd_options = " check -R ~/.config/nvim/apex_ruleset.xml"
    g.ale_apex_pmd_options = " check -R rulesets/apex/quickstart.xml"
    g.ale_apex_pmd_use_stderr = 0
    g.ale_error_format_apex = "%f:%l:%c: %m"
    g.ale_disable_lsp = "auto"
    g.ale_use_neovim_diagnostics_api = 1
    g.ale_warn_about_trailing_whitespace = 1
    g.ale_echo_cursor = 0

    g.ale_linters = {
      javascript = { "eslint" },
      css = { "eslint" },
      html = { "eslint" },
      apex = { "apexlsp", "pmd" },
      java = { "javalsp" },
      jsw = { "eslint" },
      markdown = { "markdownlint" },
      rust = { "analyzer" },
      sh = { "shellcheck" },
      typescript = { "tsserver" },
    }
    g.ale_fixers = {
      javascript = { "prettier" },
      css = { "prettier" },
      apex = { "prettier" },
      json = { "jq" },
    }
    g.ale_fix_on_save = 1
    g.ale_sign_error = ">>"
    g.ale_sign_warning = "--"
    g.ale_floating_preview = 1

    g.ale_javascript_eslint_executable = "eslint"
    g.ale_javascript_eslint_use_global = 1
    g.ale_completion_tsserver_autoimport = 1
    g.ale_apexlsp_executable = "/usr/bin/java"
  end,
}
