# Same report as `reclaim`, but posts newly completed items to Discord and
# records them so the next run stays quiet. Exits non-zero if Discord fails.
function reclaim-notify
	ssh tower python3 /mnt/user/appdata/watched-reclaim/watched_reclaim.py --notify $argv
end
