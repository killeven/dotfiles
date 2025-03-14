-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
-- vim.opt.relativenumber = true -- relative line numbers
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    branch = 'v2',
    event = "BufRead",
    config = function()
      require("hop").setup()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
      lvim.builtin.which_key.mappings["j"] = {
        name = "Hop Motion",
        j = {
          "<cmd>:HopChar1<cr>", "Go to Char"
        },
        J = {
          "<cmd>:HopChar2<cr>", "Go to Char2"
        },
        l = {
          "<cmd>:HopLine<cr>", "Go to Line"
        },
        a = {
          "<cmd>:HopAnywhere<cr>", "Go to Anywhere"
        },
        w = {
          "<cmd>:HopPattern<cr>", "Go to Word"
        }
      }
    end
  }
}
