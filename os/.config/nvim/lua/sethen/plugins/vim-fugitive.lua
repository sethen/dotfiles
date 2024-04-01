return {
   "tpope/vim-fugitive",
   opt = true,
   keys = {
      { "<Space>ga", "<cmd>Git add<CR>", desc = "Git add" },
      { "<Space>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
      { "<Space>gi", "<cmd>Git<CR>", desc = "Git interface" },
      { "<Space>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<Space>gs", "<cmd>Git stage<CR>", desc = "Git stage" },
   },
}
