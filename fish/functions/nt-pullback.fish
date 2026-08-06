function nt-pullback --description 'Pull NinjaScript file/dir back from imperator NT8 Custom (e.g. after NT rewrites generated code)'
    if test (count $argv) -lt 1
        echo "usage: nt-pullback <Indicators|Strategies>/<subpath> [local-dest]"
        echo "  e.g. nt-pullback Indicators/Ninjastrat/Vector/Vector-TrendPro.cs ."
        return 1
    end
    set -l remote_sub $argv[1]
    set -l dest .
    if test (count $argv) -ge 2
        set dest $argv[2]
    end
    set -l base "C:/Users/Spenc/Documents/NinjaTrader 8/bin/Custom"
    scp -r "imperator:$base/$remote_sub" $dest
end
