return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",

  init = function()
    vim.lsp.config("ahk2", {
      cmd = {
        "node",
        vim.fn.expand("$HOME/vscode-autohotkey2-lsp/server/dist/server.js"),
        "--stdio",
      },
      filetypes = { "ahk", "autohotkey", "ah2" },
      root_markers = { ".git", "hgrc", "ahk", "ah2" },
      init_options = { locale = "en-us" },
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    vim.lsp.config("clangd", {
      cmd = { "clangd" },
      filetypes = { "c", "cpp" },
      root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
      settings = {
        clangd = {
          completion = {
            includeWordCompletion = true,
          },
        }
      }
    })

    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" }, -- Neovimのグローバル変数 'vim' を警告から除外
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    vim.lsp.enable({ "ahk2", "clangd", "lua_ls" })
  end,
}
