return {
   "nvim-tree/nvim-web-devicons",
   dependencies = {
      "catppuccin/nvim",
   },
   config = function()
      local icons = require("nvim-web-devicons")
      local palette = require("catppuccin.palettes").get_palette("mocha")
      
      icons.set_default_icon("")
      icons.setup({
         override = {
            c = {
               color = palette.sapphire,
               icon = "",
               name = "C",
            },
            cc = {
               color = palette.sapphire,
               icon = "",
               name = "Cc",
            },
            cpp = {
               color = palette.sapphire,
               icon = "",
               name = "Cpp",
            },
            conf = {
               icon = "",
               name = "Conf",
            },
            cs = {
               color = palette.lavender,
               icon = "",
               name = "Cs",
            },
            css = {
               color = palette.blue,
               icon = "",
               name = "Css",
            },
            erb = {
               color = palette.red,
               icon = "",
               name = "Erb",
            },
            gif = {
               icon = "",
               name = "Gif",
            },
            go = {
               color = palette.teal,
               icon = "",
               name = "Go",
            },
            fish = {
               icon = "",
               name = "Fish",
            },
            html = {
               color = palette.peach,
               icon = "",
               name = "Html",
            },
            java = {
               color = palette.maroon,
               icon = "",
               name = "Java",
            },
            jar = {
               color = palette.maroon,
               icon = "",
               name = "Jar",
            },
            jpg = {
               icon = "",
               name = "Jpg",
            },
            json = {
               color = palette.green,
               icon = "",
               name = "Json",
            },
            js = {
               color = palette.yellow,
               icon = "",
               name = "Js",
            },
            jsx = {
               color = palette.sky,
               icon = "",
               name = "Jsx",
            },
            lock = {
               icon = "",
               name = "Lock",
            },
            kt = {
               color = palette.mauve,
               icon = "",
               name = "Kt",
            },
            lua = {
               color = palette.blue,
               icon = "",
               name = "Lua",
            },
            md = {
               icon = "",
               name = "Md",
            },
            ml = {
               color = palette.peach,
               icon = "",
               name = "Ml",
            },
            otf = {
               icon = "",
               name = "Otf",
            },
            pdf = {
               icon = "",
               name = "Pdf",
            },
            php = {
               color = palette.mauve,
               icon = "",
               name = "Php",
            },
            png = {
               icon = "",
               name = "Png",
            },
            ps1 = {
               icon = "",
               name = "Ps1",
            },
            py = {
               color = palette.yellow,
               icon = "",
               name = "Py",
            },
            ts = {
               color = palette.blue,
               icon = "",
               name = "Ts",
            },
            tsx = {
               color = palette.sky,
               icon = "",
               name = "Tsx",
            },
            ttf = {
               icon = "",
               name = "Ttf",
            },
            ru = {
               icon = "",
               name = "Ru",
            },
            rb = {
               color = palette.red,
               icon = "",
               name = "Rb",
            },
            rs = {
               icon = "",
               name = "Rs",
            },
            sass = {
               color = palette.pink,
               icon = "",
               name = "Sass",
            },
            scss = {
               color = palette.pink,
               icon = "",
               name = "Scss",
            },
            sh = {
               icon = "",
               name = "Sh",
            },
            swift = {
               color = palette.peach,
               icon = "",
               name = "Swift",
            },
            sql = {
               color = palette.sky,
               icon = "",
               name = "Sql",
            },
            svg = {
               icon = "",
               name = "Svg",
            },
            tiff = {
               icon = "",
               name = "Tiff",
            },
            toml = {
               icon = "",
               name = "Toml",
            },
            txt = {
               icon = "",
               name = "Txt",
            },
            woff = {
               icon = "",
               name = "Woff",
            },
            yaml = {
               icon = "",
               name = "Yaml",
            },
            yml = {
               icon = "",
               name = "Yml",
            },
            zig = {
               color = palette.yellow,
               icon = "",
               name = "Zig",
            },
            zip = {
               icon = "",
               name = "Zip",
            },
            zsh = {
               icon = "",
               name = "Zsh",
            },
            [".editorconfig"] = {
               icon = "",
               name = "Editorconfig",
            },
            [".gitignore"] = {
               color = palette.red,
               icon = "",
               name = "Gitignore",
            },
            [".gitconfig"] = {
               color = palette.red,
               icon = "",
               name = "Gitconfig",
            },
            [".zshrc"] = {
               icon = "",
               name = "Zshrc",
            },
            [".zshenv"] = {
               icon = "",
               name = "Zshenv",
            },
            ["commit_editmsg"] = {
               icon = "",
               name = "Commit_editmsg",
            },
            ["license"] = {
               icon = "",
               name = "License",
            },
            ["log"] = {
               icon = "",
               name = "Log",
            },
            ["package.json"] = {
               color = palette.red,
               icon = "",
               name = "Package.json",
            },
            ["package-lock.json"] = {
               color = palette.red,
               icon = "",
               name = "PackageLock.json",
            },
            ["rakefile"] = {
               color = palette.red,
               icon = "",
               name = "Rakefile",
            },
            ["rake"] = {
               color = palette.red,
               icon = "",
               name = "Rake",
            },
            ["config.ru"] = {
               color = palette.red,
               icon = "",
               name = "Config.ru",
            },
            ["tsconfig.json"] = {
               color = palette.blue,
               icon = "",
               name = "TsConfig.json",
            },
            [".dockerignore"] = {
               color = palette.blue,
               icon = "",
               name = "Dockerignore",
            },
            ["dockerfile"] = {
               color = palette.blue,
               icon = "",
               name = "Dockerfile",
            },
            ["docker-compose.yml"] = {
               color = palette.blue,
               icon = "",
               name = "DockerCompose.yml",
            },
            ["makefile"] = {
               icon = "",
               name = "Makefile",
            },
            ["procfile"] = {
               icon = "",
               name = "Procfile",
            },
         },
      })
   end,
}
