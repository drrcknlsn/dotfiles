return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local should_show = function()
      return vim.fn.winwidth(0) > 100
    end

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    -- local filename = {
    --   'filename',
    --   file_status = true,
    --   path = 0,
    -- }

    local diagnostics = {
      'diagnostics',
      sources = {
        'nvim_diagnostic',
      },
      -- sections = {
      --   'error',
      --   'warn',
      -- },
      symbols = {
        error = ' ',
        warn = ' ',
        info = ' ',
        hint = ' ',
      },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = should_show,
    }

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        disabled_filetypes = {
          'neo-tree',
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { diagnostics, { 'encoding', cond = should_show }, { 'fileformat', cond = should_show }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}
