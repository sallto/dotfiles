local keymap = vim.keymap.set
print("test123")

local key_opts = { silent = true }

keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

require("rust-tools").setup {
  tools = {
    on_initialized = function()
      vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
    end,
  },
  server = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
return {}
