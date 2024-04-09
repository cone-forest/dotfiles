return {
	{
		'echasnovski/mini.splitjoin',
		-- stylua: ignore
		keys = {
			{ 'sj', '<cmd>lua MiniSplitjoin.join()<CR>', mode = { 'n', 'x' }, desc = 'Join arguments' },
			{ 'sk', '<cmd>lua MiniSplitjoin.split()<CR>', mode = { 'n', 'x' }, desc = 'Split arguments' },
		},
		opts = {
			mappings = { toggle = '' },
		},
	},
}
