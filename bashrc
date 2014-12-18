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
