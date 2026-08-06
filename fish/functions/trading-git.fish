function trading-git --description 'Run git across all ~/repos/trading subrepos (status|pull|fetch)'
    set -l cmd status
    if test (count $argv) -ge 1
        set cmd $argv[1]
    end
    for d in ~/repos/trading/*/ ~/repos/trading/TradingView/*/
        if not test -d $d/.git
            continue
        end
        set_color cyan
        echo "=== "(basename $d)" ==="
        set_color normal
        switch $cmd
            case status
                git -C $d status -s
            case pull
                git -C $d pull --rebase --autostash
            case fetch
                git -C $d fetch --all -q
                and git -C $d status -s
            case '*'
                echo "unknown cmd: $cmd (use status|pull|fetch)"
                return 1
        end
    end
end
