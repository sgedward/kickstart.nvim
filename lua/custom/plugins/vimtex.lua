return {
  'lervag/vimtex',
  lazy = false, -- VimTeX should load immediately
  init = function()
    -- This variable controls the viewer.
    -- 'skim' is best for Mac, 'zathura' is best for Linux.
    vim.g.vimtex_view_method = 'skim'

    -- Optional: If you strictly want pdflatex and NOT xelatex/lualatex
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-pdf',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
  end,
}
