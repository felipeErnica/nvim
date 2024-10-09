return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function()
      local builtin = require('telescope.builtin')
      local keymap = vim.keymap
      keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
