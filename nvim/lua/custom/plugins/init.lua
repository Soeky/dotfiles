-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file)
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

    -- vim.keymap.set('n', '<C-h>', function()
    --   ui.nav_file(1)
    -- end)
    vim.keymap.set('n', '<C-t>', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<C-n>', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<C-s>', function()
      ui.nav_file(3)
    end)
  end,
}
