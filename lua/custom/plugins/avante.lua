return {
  'yetone/avante.nvim',
  -- Build command: Handles Windows vs Unix automatically
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  version = false, -- Always use the latest commit (recommended by plugin author)
  opts = {
    -- 1. PROVIDER SETUP
    provider = 'deepseek',
    auto_suggestions_provider = nil, -- Disable ghost text/autocompletion

    providers = {
      deepseek = {
        __inherited_from = 'openai',
        api_key_name = 'DEEPSEEK_API_KEY',
        endpoint = 'https://api.deepseek.com/v1',
        model = 'deepseek-chat',
      },
    },

    -- 2. BEHAVIOUR & WORKFLOW
    behaviour = {
      auto_suggestions = false, -- Disable auto-suggestions (ghost text)
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false, -- CRITICAL: Set to false to force Accept/Reject confirmation
      support_paste_from_clipboard = true,
    },

    -- 3. KEY MAPPINGS
    mappings = {
      -- Main Commands
      ask = '<leader>aa', -- Normal: Toggle Sidebar | Visual: Ask about selection
      edit = '<leader>ae', -- Visual Mode Only: Edit the selected code
      refresh = '<leader>ar', -- Refresh sidebar context

      -- Diff / Confirmation Controls
      diff = {
        ours = 'co', -- Reject AI (Keep Ours)
        theirs = 'ct', -- Accept AI (Keep Theirs)
        all_theirs = 'ca', -- Accept All AI Changes
        both = 'cb', -- Keep Both
        cursor = 'cc', -- Move cursor to conflict
        next = ']x', -- Jump to next conflict
        prev = '[x', -- Jump to prev conflict
      },

      -- Navigation inside the Sidebar
      sidebar = {
        switch_windows = '<Tab>', -- Jump between Chat and Code
        reverse_switch_windows = '<S-Tab>',
      },

      -- Submit prompt
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
    },

    instructions_file = 'avante.md',
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp', -- Standard LSP completion
    'nvim-tree/nvim-web-devicons',
    'stevearc/dressing.nvim',
    'folke/snacks.nvim',
    'MeanderingProgrammer/render-markdown.nvim',

    -- Image support (Drag & Drop images into chat)
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          emd_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
  },
}
