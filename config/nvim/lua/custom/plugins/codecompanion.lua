-- CodeCompanion.nvim - AI-powered code completion and assistance
return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      { '<leader>ai', '<cmd>CodeCompanionActions<CR>', desc = '[A]I [I]nstructions', mode = { 'n', 'v' } },
      { '<leader>ac', '<cmd>CodeCompanionChat<CR>', desc = '[A]I [C]hat', mode = { 'n', 'v' } },
      { '<leader>at', '<cmd>CodeCompanionToggle<CR>', desc = '[A]I [T]oggle Chat' },
    },
    opts = {
      strategies = {
        chat = 'anthropic',
        inline = 'anthropic',
        agent = 'anthropic',
      },
      adapters = {
        anthropic = {
          schema = {
            model = {
              default = 'claude-3-5-sonnet-20241022',
            },
          },
        },
      },
    },
  },
}
