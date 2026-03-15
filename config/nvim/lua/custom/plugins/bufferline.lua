-- Buffer tabs at the top (like VS Code tabs)
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          separator = true,
        },
      },
      -- Ensure terminal buffers show in the tab bar
      custom_filter = function(buf_number)
        -- Always show terminal buffers
        if vim.bo[buf_number].buftype == 'terminal' then
          return true
        end
        return true
      end,
      -- Clean names for terminal tabs
      name_formatter = function(buf)
        if buf.name and buf.name:match 'term://' then
          return ' Terminal'
        end
      end,
    },
  },
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next Buffer' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = '[B]uffer [P]in' },
    { '<leader>bc', '<cmd>BufferLinePickClose<CR>', desc = '[B]uffer [C]lose Pick' },
  },
}
