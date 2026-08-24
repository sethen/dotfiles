return {
   -- configure-user prompts for this and config.fish exports it, so honour the
   -- answer rather than assuming ~/Developer. nvim started outside that shell
   -- (from a desktop entry, say) sees no value, hence the fallback.
   developer_directory = vim.env.DEVELOPER_DIRECTORY or (vim.env.HOME .. '/Developer'),
   keymaps = {
      accept = '<CR>',
      left = 'h',
      right = 'l',
      select_next = '<C-n>',
      select_previous = '<C-p>',
      unselect = '<C-h>',
      select = '<C-l>',
   },
}