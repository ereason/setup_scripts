local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

telescope.setup({
	  extensions = {
	      fzf = {
	             fuzzy = true,                    -- false will only do exact matching
	             override_generic_sorter = true,  -- override the generic sorter
	             override_file_sorter = true,     -- override the file sorter
	             case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
	         }                                             -- the default case_mode is "smart_case"
	   },
	
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist -- send selected to quickfixlist
			}
		}
	}
})

telescope.load_extension("fzf")