-- Harpoon - Quick file/terminal navigation
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ha', function() require('harpoon'):list():add() end, desc = '[H]arpoon [A]dd' },
      { '<leader>hm', function() local harpoon = require('harpoon'); harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = '[H]arpoon [M]enu' },
      { '<leader>h1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon 1' },
      { '<leader>h2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon 2' },
      { '<leader>h3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon 3' },
      { '<leader>h4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon 4' },
      { '<leader>h5', function() require('harpoon'):list():select(5) end, desc = 'Harpoon 5' },
    },
    config = function()
      require('harpoon').setup {
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
        },
      }
    end,
  },
}
