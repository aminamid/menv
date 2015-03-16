# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias z30='ssh root@jpn-zaq30.openwave.com'
alias z30v1='ssh root@jpn-zaq30-v1.openwave.com'
alias z30v2='ssh root@jpn-zaq30-v2.openwave.com'
alias z30v3='ssh root@jpn-zaq30-v3.openwave.com'
alias z40='ssh root@jpn-zaq40.openwave.com'
alias z40v1='ssh root@jpn-zaq40-v1.openwave.com'
alias z40v2='ssh root@jpn-zaq40-v2.openwave.com'
alias z40v3='ssh root@jpn-zaq40-v3.openwave.com'
alias z50='ssh root@jpn-zaq50.openwave.com'
alias z50v1='ssh root@jpn-zaq50-v1.openwave.com'
alias z50v2='ssh root@jpn-zaq50-v2.openwave.com'
alias z50v3='ssh root@jpn-zaq50-v3.openwave.com'

alias tmn='TERM=screen-256color-bce tmux new -s $USER'
alias tmls='TERM=screen-256color-bce tmux ls'
alias tmd='TERM=screen-256color-bce tmux detach'
alias tma='TERM=screen-256color-bce tmux a -t '

auto_cdls()
{
    if [ "$OLDPWD" != "$PWD" ]; then
        ls
        OLDPWD="$PWD"
    fi
}
PROMPT_COMMAND="$PROMPT_COMMAND"$'\n'auto_cdls

mssh()
{    
    if [ -n "$SESSION_NAME" ];then
      session=$SESSION_NAME
    else
      session=multi-ssh-`date +%s`
    fi
    window=multi-ssh
    
    ### tmuxのセッションを作成
    tmux new-session -d -n $window -s $session
     
    ### 各ホストにsshログイン
    # 最初の1台はsshするだけ
    tmux send-keys "ssh $1" C-m
    shift
    
    # 残りはpaneを作成してからssh
    for i in $*;do
      tmux split-window
      tmux select-layout tiled
      tmux send-keys "ssh $i" C-m
    done
    
    ### 最初のpaneを選択状態にする
    tmux select-pane -t 0
    
    ### paneの同期モードを設定
    tmux set-window-option synchronize-panes on
    
    ### セッションにアタッチ
    tmux attach-session -t $session
}

sol_dark()
{
    echo -ne   '\eP\e]10;#839496\a'  # Foreground   -> base0
    echo -ne   '\eP\e]11;#002B36\a'  # Background   -> base03
    
    echo -ne   '\eP\e]12;#DC322F\a'  # Cursor       -> red
    
    echo -ne  '\eP\e]4;0;#073642\a'  # black        -> Base02
    echo -ne  '\eP\e]4;8;#002B36\a'  # bold black   -> Base03
    echo -ne  '\eP\e]4;1;#DC322F\a'  # red          -> red
    echo -ne  '\eP\e]4;9;#CB4B16\a'  # bold red     -> orange
    echo -ne  '\eP\e]4;2;#859900\a'  # green        -> green
    echo -ne '\eP\e]4;10;#586E75\a'  # bold green   -> base01 *
    echo -ne  '\eP\e]4;3;#B58900\a'  # yellow       -> yellow
    echo -ne '\eP\e]4;11;#657B83\a'  # bold yellow  -> base00 *
    echo -ne  '\eP\e]4;4;#268BD2\a'  # blue         -> blue
    echo -ne '\eP\e]4;12;#839496\a'  # bold blue    -> base0 *
    echo -ne  '\eP\e]4;5;#D33682\a'  # magenta      -> magenta
    echo -ne '\eP\e]4;13;#6C71C4\a'  # bold magenta -> violet
    echo -ne  '\eP\e]4;6;#2AA198\a'  # cyan         -> cyan
    echo -ne '\eP\e]4;14;#93A1A1\a'  # bold cyan    -> base1 *
    echo -ne  '\eP\e]4;7;#EEE8D5\a'  # white        -> Base2
    echo -ne '\eP\e]4;15;#FDF6E3\a'  # bold white   -> Base3
}

sol_light()
{
    echo -ne   '\eP\e]10;#657B83\a'  # Foreground   -> base00
    echo -ne   '\eP\e]11;#FDF6E3\a'  # Background   -> base3
    
    echo -ne   '\eP\e]12;#DC322F\a'  # Cursor       -> red
    
    echo -ne  '\eP\e]4;0;#073642\a'  # black        -> Base02
    echo -ne  '\eP\e]4;8;#002B36\a'  # bold black   -> Base03
    echo -ne  '\eP\e]4;1;#DC322F\a'  # red          -> red
    echo -ne  '\eP\e]4;9;#CB4B16\a'  # bold red     -> orange
    echo -ne  '\eP\e]4;2;#859900\a'  # green        -> green
    echo -ne '\eP\e]4;10;#586E75\a'  # bold green   -> base01 *
    echo -ne  '\eP\e]4;3;#B58900\a'  # yellow       -> yellow
    echo -ne '\eP\e]4;11;#657B83\a'  # bold yellow  -> base00 *
    echo -ne  '\eP\e]4;4;#268BD2\a'  # blue         -> blue
    echo -ne '\eP\e]4;12;#839496\a'  # bold blue    -> base0 *
    echo -ne  '\eP\e]4;5;#D33682\a'  # magenta      -> magenta
    echo -ne '\eP\e]4;13;#6C71C4\a'  # bold magenta -> violet
    echo -ne  '\eP\e]4;6;#2AA198\a'  # cyan         -> cyan
    echo -ne '\eP\e]4;14;#93A1A1\a'  # bold cyan    -> base1 *
    echo -ne  '\eP\e]4;7;#EEE8D5\a'  # white        -> Base2
    echo -ne '\eP\e]4;15;#FDF6E3\a'  # bold white   -> Base3
}
