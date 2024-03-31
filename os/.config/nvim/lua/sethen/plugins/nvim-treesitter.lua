return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      "windwp/nvim-ts-autotag"
   },
   build = ":TSUpdate",
   config = function()
      require("nvim-treesitter.configs").setup({
         autotag = {
            enable = true
         },
         ensure_installed = {
            "bash",
            "c",
            "css",
            "dockerfile",
            "fish",
            "gitignore",
            "go",
            "html",
            "lua",
            "markdown",
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "vim",
            "vimdoc",
            "zig"
         },
         highlight = {
            enable = true,
         },
         indent = {
            enable = true
         },
      })
   end,
}
