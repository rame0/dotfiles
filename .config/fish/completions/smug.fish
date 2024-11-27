complete --command smug --exclusive -e

complete --command smug --exclusive --short f --long file -d "A custom path to a config file"
complete --command smug --exclusive --short w --long windows -d "List of windows to start. If session exists, those windows will be attached to current session"
complete --command smug --exclusive --short a --long attach -d "Force switch client for a session"
complete --command smug --exclusive --short i --long inside-current-session -d "Create all windows inside current session"
complete --command smug --exclusive --short d --long debug -d "Print all commands to ~/.config/smug/smug.log"
complete --command smug --exclusive --long detach -d "Detach tmux session. The same as -d flag in the tmux"


complete --command smug --exclusive --condition __fish_use_subcommand --arguments list -d "list available project configurations"
complete --command smug --exclusive --condition __fish_use_subcommand --arguments edit -d "Edit project configuration"
complete --command smug --exclusive --condition __fish_use_subcommand --arguments new -d "New project configuration"
complete --command smug --exclusive --condition __fish_use_subcommand --arguments start -d "Start project session"
complete --command smug --exclusive --condition __fish_use_subcommand --arguments stop -d "Stop project session"
complete --command smug --exclusive --condition __fish_use_subcommand --arguments print -d "Session configuration to stdout"


complete --command smug --exclusive --condition "__fish_seen_subcommand_from edit start stop print" --arguments "(smug list)"

