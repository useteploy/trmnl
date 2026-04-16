-- Neotest - Run tests directly in Neovim
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/neotest-go',
      'rouge8/neotest-rust',
    },
    keys = {
      { '<leader>tr', '<cmd>Neotest run<CR>', desc = '[T]est [R]un' },
      { '<leader>tn', '<cmd>Neotest nearest<CR>', desc = '[T]est [N]earest' },
      { '<leader>ts', '<cmd>Neotest summary<CR>', desc = '[T]est [S]ummary' },
      { '<leader>tl', '<cmd>Neotest last<CR>', desc = '[T]est [L]ast' },
      { '<leader>tf', '<cmd>Neotest failed<CR>', desc = '[T]est [F]ailed' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            python = (function()
              local path = vim.fn.exepath 'python3'
              if path == '' then path = 'python' end
              return path
            end)(),
          },
          require 'neotest-jest' {
            jestCommand = 'jest --',
            jestConfigFile = function(file)
              if string.find(file, '/packages/') then
                return string.match(file, '(.-/packages/[^/]+)') .. '/jest.config.js'
              end
              return vim.fn.getcwd() .. '/jest.config.js'
            end,
            env = { CI = true },
            cwd = function(file)
              if string.find(file, '/packages/') then
                return string.match(file, '(.-/packages/[^/]+)')
              end
              return vim.fn.getcwd()
            end,
          },
          require 'neotest-go',
          require 'neotest-rust',
        },
      }
    end,
  },
}
