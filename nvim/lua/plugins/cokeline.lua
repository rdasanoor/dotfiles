local map = vim.api.nvim_set_keymap
local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close
local get_hex = require("cokeline.utils").get_hex
local space = { text = " " }
-- local active_bg_color = "#505050"
-- local inactive_bg_color = "#202020"
-- local bg_color = "#0E0D0D"

vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#0E0D0D" })

map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
-- map("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true })
-- map("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true })
map("n", "<Leader>pf", "<Plug>(cokeline-pick-focus)", { silent = true })
map("n", "<Leader>pc", "<Plug>(cokeline-pick-close)", { silent = true })

for i = 1, 9 do
	map(
		"n",
		("<Leader><Leader>%s"):format(i),
		("<Plug>(cokeline-focus-%s)"):format(i),
		{ silent = true }
	)
	map(
		"n",
		("<Leader>%s"):format(i),
		("<Plug>(cokeline-switch-%s)"):format(i),
		{ silent = true }
	)
end

require("cokeline").setup({
	mappings = {
		cycle_prev_next = true,
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and nil or get_hex("Comment", "fg")
		end,
		bg = "none",
	},
	components = {
		space,
		{
			text = function(buffer)
				if buffer.is_focused then
					if is_picking_close() then
						return buffer.pick_letter .. " "
					else
						return buffer.devicon.icon .. " "
					end
				elseif is_picking_close() or is_picking_focus() then
					return buffer.pick_letter .. " "
				else
					return buffer.devicon.icon .. " "
				end
			end,
			fg = function(buffer)
				if is_picking_focus() then
					if buffer.is_focused then
						return buffer.devicon.color
					else
						return "#FFFF00"
					end
				elseif is_picking_close() then
					return "#FF0000"
				else
					return buffer.devicon.color
				end
			end,
		},
		{
			text = function(buffer)
				return buffer.filename
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return "#EBCDFF"
				end
				if buffer.is_modified then
					return "#E5C463"
				end
				if buffer.diagnostics.errors ~= 0 then
					return "#FC5D7C"
				end
			end,
			style = function(buffer)
				if buffer.is_focused then
					return "underline"
				end
				return nil
			end,
		},
		{
			text = function(buffer)
				if buffer.is_readonly then
					return " "
				end
				return ""
			end,
		},
		space,
	},
})

-- require('cokeline').setup({
--     show_if_buffers_are_at_least = 1,
--     buffers = {
--         focus_on_delete = 'prev'
--     },
--     mappings = {
--         cycle_prev_next = true
--     },
--     default_hl = {
--         fg = function(buffer)
--             if buffer.is_focused then
--                 return '#202020'
--             else
--                 return '#505050'
--             end
--         end,
--         bg = function(buffer)
--             if buffer.is_focused then
--                 return active_bg_color
--             else
--                 return inactive_bg_color
--             end
--         end,
--     },
--     components = {
--         {
--             text = function(buffer)
--                 local _text = ''
--                 if buffer.index > 1 then _text = ' ' end
--                 if buffer.is_focused or buffer.is_first then
--                     _text = _text .. ''
--                 end
--                 return _text
--             end,
--             fg = function(buffer)
--                 if buffer.is_focused then
--                     return active_bg_color
--                 elseif buffer.is_first then
--                     return inactive_bg_color
--                 end
--             end,
--             bg = function(buffer)
--                 if buffer.is_focused then
--                     if buffer.is_first then
--                         return bg_color
--                     else
--                         return inactive_bg_color
--                     end
--                 elseif buffer.is_first then
--                     return bg_color
--                 end
--             end
--         },
--         {
--             text = function(buffer)
--                 local status = ''
--                 if buffer.is_readonly then
--                     status = '➖'
--                 end
--                 return status
--             end,
--         },
--         {
--             text = function(buffer)
--                 if(buffer.is_focused) then
--                     if(is_picking_close()) then
--                         return buffer.pick_letter .. ' '
--                     else
--                         if(buffer.filetype == 'dockerfile') then
--                             return '  '
--                         end
--                         return buffer.devicon.icon
--                     end
--                 elseif (is_picking_focus() or is_picking_close()) then
--                     return buffer.pick_letter .. ' '
--                 else
--                     return buffer.devicon.icon
--                 end
--             end,
--             fg = function(buffer)
--                 if(is_picking_focus()) then
--                     if(buffer.is_focused) then
--                         return buffer.devicon.color
--                     else
--                         return '#FFFF00'
--                     end
--                 elseif(is_picking_close()) then
--                     return '#FF0000'
--                 elseif(buffer.is_focused) then
--                     if(buffer.filetype == 'dockerfile') then
--                         return '#00CCCC'
--                     elseif(buffer.filetype == 'tex') then
--                         return '#00FF00'
--                     end
--                     return buffer.devicon.color
--                 end
--             end,
--             style = function(_)
--                 return
--                     (is_picking_focus() or is_picking_close())
--                     and 'italic,bold'
--                      or nil
--             end
--         },
--         {
--             text = function(buffer)
--                 return buffer.unique_prefix .. buffer.filename
--             end,
--             fg = function(buffer)
--                 if(buffer.diagnostics.errors > 0) then
--                     return '#C95157'
--                 end
--             end,
--             style = function(buffer)
--                 local text_style = 'NONE'
--                 if buffer.is_focused then
--                     text_style = 'bold'
--                 end
--                 if buffer.diagnostics.errors > 0 then
--                     if text_style ~= 'NONE' then
--                         text_style = text_style .. ',underline'
--                     else
--                         text_style = 'underline'
--                     end
--                 end
--                 return text_style
--             end
--         },
--         {
--             text = function(buffer)
--                 local errors = buffer.diagnostics.errors
--                 local status = ''
--                 if errors <= 9 then
--                     status = ' ●'
--                 else
--                     status = ' '
--                 end
--                 return status .. ' '
--             end,
--             fg = function(buffer)
--                 if buffer.diagnostics.errors == 0 then
--                     return '#3DEB63'
--                 else
--                     return '#FF0000'
--                 end
--             end
--         },
--         {
--             text = function(buffer)
--                 if buffer.is_focused or buffer.is_last then
--                     return ''
--                 else
--                     return ' '
--                 end
--             end,
--             fg = function(buffer)
--                 if buffer.is_focused then
--                     return active_bg_color
--                 elseif buffer.is_last then
--                     return inactive_bg_color
--                 else
--                     return bg_color
--                 end
--             end,
--             bg = function(buffer)
--                 if buffer.is_focused then
--                     if buffer.is_last then
--                         return bg_color
--                     else
--                         return inactive_bg_color
--                     end
--                 elseif buffer.is_last then
--                     return bg_color
--                 end
--             end
--         }
--     }
-- })
