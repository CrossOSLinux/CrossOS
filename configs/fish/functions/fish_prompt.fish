function fish_prompt
    # Set Cross OS theme on first run
    if not set -q CROSSOS_THEME_SET
        fish_config theme choose 'ayu Dark'
        set -U CROSSOS_THEME_SET true
    end

    set_color $fish_color_cwd
    echo -n (path basename $PWD)
    set_color normal
    echo -n ' ) '
end
