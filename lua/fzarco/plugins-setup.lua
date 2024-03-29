local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use ("wbthomason/packer.nvim")
    use ("tpope/vim-commentary")
    use ("ap/vim-css-color")
    use ("ryanoasis/vim-devicons")
    use ("rafi/awesome-vim-colorschemes")
    use ("savq/melange-nvim")
    use "rebelot/kanagawa.nvim"
    use ("tpope/vim-surround")
    use ("vim-scripts/ReplaceWithRegister")
    use ("nvim-lualine/lualine.nvim")
    use "nvim-lua/plenary.nvim"

    -- Nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    -- Git Integration
    use ("lewis6991/gitsigns.nvim")

    -- Telescope
    use ({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use ({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

    -- Autocompletion
    use ("hrsh7th/nvim-cmp")
    use ("hrsh7th/cmp-buffer")
    use ("hrsh7th/cmp-path")

    -- Snippets
    use ("L3MON4D3/LuaSnip")
    use ("saadparwaiz1/cmp_luasnip")
    use ("rafamadriz/friendly-snippets")

    -- Managing / Installing LSP Servers
    use ("williamboman/mason.nvim")
    use ("williamboman/mason-lspconfig.nvim")

    -- Configuring LSP servers
    use ("neovim/nvim-lspconfig")
    use ("hrsh7th/cmp-nvim-lsp")
    use ("onsails/lspkind.nvim")

    -- ThePrimeagen's Harpoon
    use("ThePrimeagen/harpoon")

    -- Treesitter
    use ({
        "nvim-treesitter/nvim-treesitter",
        run = function ()
            require("nvim-treesitter.install").update({ with_sync = true})
        end,
    })

    -- Auto Pairs
    use ("windwp/nvim-autopairs")

	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Plug 'https://github.com/tpope/vim-surround.git'

