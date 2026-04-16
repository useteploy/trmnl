-- Harpoon - Quick file/terminal navigation
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ma', function() require('harpoon'):list():add() end, desc = '[M]ark [A]dd' },
      { '<leader>mm', function() local harpoon = require('harpoon'); harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = '[M]ark [M]enu' },
      { '<leader>m1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon 1' },
      { '<leader>m2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon 2' },
      { '<leader>m3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon 3' },
      { '<leader>m4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon 4' },
      { '<leader>m5', function() require('harpoon'):list():select(5) end, desc = 'Harpoon 5' },
    },
    config = function()
      require('harpoon'):setup {
        settings = {
          save_on_toggle = false,
          save_on_change = true,
        },
      }
    end,
  },
}
