let s:black = [ '#000000', 200 ]
let s:blue = [ '#82aaff', 200 ]
let s:dark_blue = [ '#4d7bcb', 200 ]
let s:grey = [ '#263238', 200 ]
let s:light_grey = [ '#4f5b62', 200 ]
let s:green = [ '#c3e88d', 119 ]
let s:dark_green = [ '#91b65e', 220 ]
let s:pale_blue = [ '#89ddff', 255 ]
let s:dark_pale_blue = [ '#54abcc', 200 ]
let s:purple = [ '#c792ea', 200 ]
let s:dark_purple = [ '#9563b7', 200 ]
let s:orange = [ '#f78c6c', 203 ]
let s:dark_orange = [ '#c05d40', 200 ]
let s:red = [ '#f07178', 200 ]
let s:white = [ '#ffffff', 200 ]
let s:yellow = [ '#ffcb6b', 200 ]

let s:p = {'command' : {}, 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}}

let s:p.command.left = [ [ s:black, s:blue ], [ s:black, s:dark_blue ] ]
let s:p.command.middle = [ [ s:white, s:light_grey ] ]
let s:p.command.right = [ [ s:black, s:blue ], [ s:black, s:dark_blue ] ]

let s:p.inactive.left =  [ [ s:white, s:light_grey ], [ s:white, s:light_grey ] ]
let s:p.inactive.middle = [ [ s:white, s:light_grey ] ]
let s:p.inactive.right = [ [ s:white, s:light_grey ], [ s:white, s:light_grey ] ]

let s:p.insert.left = [ [ s:black, s:green ], [ s:black, s:dark_green ] ]
let s:p.insert.middle = [ [ s:white, s:light_grey ] ]
let s:p.insert.right = [ [ s:black, s:green ], [ s:black, s:dark_green ] ]

let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.left = [ [ s:black, s:pale_blue ], [ s:black, s:dark_pale_blue ] ]
let s:p.normal.middle = [ [ s:white, s:light_grey ] ]
let s:p.normal.right = [ [ s:black, s:pale_blue ], [ s:black, s:dark_pale_blue ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let s:p.replace.left = [ [ s:black, s:orange ], [ s:black, s:dark_orange ] ]
let s:p.replace.middle = [ [ s:white, s:light_grey ] ]
let s:p.replace.right = [ [ s:black, s:orange ], [ s:black, s:dark_orange ] ]

let s:p.visual.left = [ [ s:black, s:purple ], [ s:black, s:dark_purple ] ]
let s:p.visual.middle = [ [ s:white, s:light_grey ] ]
let s:p.visual.right = [ [ s:black, s:purple ], [ s:black, s:dark_purple ] ]

let g:lightline#colorscheme#lightline_material#palette = lightline#colorscheme#flatten(s:p)
