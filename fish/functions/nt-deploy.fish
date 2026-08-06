function nt-deploy --description 'Deploy NinjaScript file/dir to imperator NT8 Custom folder'
    if test (count $argv) -lt 2
        echo "usage: nt-deploy <local-file-or-dir> <Indicators|Strategies>[/subfolder]"
        echo "  e.g. nt-deploy Indicators/Vector/Vector-TrendPro.cs Indicators/Ninjastrat/Vector"
        return 1
    end
    set -l src $argv[1]
    set -l remote_sub $argv[2]
    set -l base "C:/Users/Spenc/Documents/NinjaTrader 8/bin/Custom"
    set -l remote "$base/$remote_sub"

    if not test -e $src
        echo "nt-deploy: local path not found: $src"
        return 1
    end

    # create nested remote folder (handles spaces in path)
    if not ssh imperator "powershell -NoProfile -Command \"New-Item -ItemType Directory -Force -Path '$remote' | Out-Null\""
        echo "nt-deploy: failed to create remote dir"
        return 1
    end

    if scp -r $src "imperator:$remote/"
        echo "nt-deploy: $src -> $remote"
        echo "  recompile in NT8 (RDP): Tools > Edit NinjaScript > Compile"
    else
        echo "nt-deploy: scp failed"
        return 1
    end
end
