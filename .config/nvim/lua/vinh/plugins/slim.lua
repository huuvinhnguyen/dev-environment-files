local M = {}

function M.setup()
	vim.g.vim_slim_indent_script = 1
	vim.g.vim_slim_autoload_haml = 1
	vim.g.vim_slim_html = 1
	vim.g.vim_slim_enable_multiline_attr = 1
	vim.g.vim_slim_expand_tabs = 1
	vim.g.vim_slim_preserve_trailing_white_space = 1
	vim.g.vim_slim_fold_enabled = 1
	vim.g.vim_slim_indent_case = 1
	vim.g.vim_slim_indent_tags = 1

	-- Highlight groups
	vim.cmd("highlight link slimTagDelimiterDelimiter htmlTag")
	vim.cmd("highlight link slimError Error")
	vim.cmd("highlight link slimOperator Operator")
	vim.cmd("highlight link slimAttribute Keyword")
	vim.cmd("highlight link slimBoolean Boolean")
	vim.cmd("highlight link slimInterpolationDelimiterDelimiter Delimiter")
	vim.cmd("highlight link slimLineBreakDelimiterDelimiter Delimiter")
	vim.cmd("highlight link slimComment Comment")
end

return M
