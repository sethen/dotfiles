return {
   'nvim-telescope/telescope-fzf-native.nvim',
   build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
}
