-- Miscellaneous quality-of-life plugins
return {
  -- Better buffer delete (keeps window layout)
  {
    'famiu/bufdelete.nvim',
    keys = {
      { '<leader>bd', '<cmd>Bdelete<CR>', desc = '[B]uffer [D]elete' },
    },
  },

  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Highlight colors inline (e.g. #ff0000 shows red)
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'BufReadPre',
    opts = {
      render = 'virtual',
      enable_tailwind = true,
    },
  },
}
