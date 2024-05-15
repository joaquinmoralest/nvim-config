return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "scss",
        "sql",
        "svelte",
        "angular",
        "typescript",
        "javascript",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- mdx
      vim.filetype.add({
        extensioon = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
