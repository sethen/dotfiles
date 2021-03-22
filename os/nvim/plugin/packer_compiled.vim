" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/sethen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sethen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sethen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sethen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sethen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/material.vim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-visual-selection"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/nerdtree-visual-selection"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.nvim-lspconfig\frequire\0" },
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/home/sethen/.local/share/nvim/site/pack/packer/start/yats.vim"
  }
}

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.nvim-lspconfig\frequire\0", "config", "nvim-lspconfig")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
