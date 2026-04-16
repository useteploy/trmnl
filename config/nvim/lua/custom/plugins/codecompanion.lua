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
      { '<leader>at', '<cmd>CodeCompanionChat Toggle<CR>', desc = '[A]I [T]oggle Chat' },
    },
    opts = {
      strategies = {
        chat = { adapter = 'anthropic' },
        inline = { adapter = 'anthropic' },
        agent = { adapter = 'anthropic' },
      },
      adapters = {
        anthropic = {
          schema = {
            model = {
              default = 'claude-sonnet-4-20250514',
            },
          },
        },
      },
    },
  },
}
