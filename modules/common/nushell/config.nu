let zvm_bin_path = ($env.HOME | path join ".zvm" "bin")
let local_path   = ($env.HOME | path join ".local" "bin")

$env.PATH = ($env.PATH | prepend $zvm_bin_path)
$env.PATH = ($env.PATH | prepend $local_path)
$env.PATH = ($env.PATH | prepend $env.HOME)

$env.EDITOR = "hx"

$env.config.show_banner = false

use ~/.cache/starship/init.nu

alias hget  = http get    --allow-errors
alias hpost = http post   --allow-errors
alias hput  = http put    --allow-errors
alias hdel  = http delete --allow-errors
alias tree  = eza --tree
