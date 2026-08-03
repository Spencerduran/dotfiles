# Report what shared users have finished watching that is still on disk.
# Read-only: sends no Discord message and does not touch saved state.
function reclaim
	ssh tower python3 /mnt/user/appdata/watched-reclaim/watched_reclaim.py $argv
end
