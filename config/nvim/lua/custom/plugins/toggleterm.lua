-- Terminal toggle with multiple modes
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- Ctrl+\ for quick floating terminal
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
    }

    -- Open a terminal as a buffer tab (shows in bufferline alongside files)
    vim.keymap.set('n', '<leader>tt', function()
      vim.cmd 'enew'
      vim.cmd 'terminal'
      vim.bo.buflisted = true
      vim.cmd 'startinsert'
    end, { desc = '[T]erminal [T]ab' })

    -- Horizontal terminal split (bottom panel, VS Code style)
    vim.keymap.set('n', '<leader>tH', function()
      vim.cmd 'botright 15split | terminal'
      vim.bo.buflisted = false -- don't clutter bufferline for splits
      vim.cmd 'startinsert'
    end, { desc = '[T]erminal [H]orizontal' })
  end,
}
