function fixmonitor
    set -l id (displayplacer list 2>&1 | awk '/^Persistent screen id:/{id=$NF} /49 inch/{print id; exit}')

    if test -z "$id"
        echo "49 inch monitor not found"
        return 1
    end

    echo "Found monitor: $id"
    displayplacer "id:$id res:5120x1440 hz:60 color_depth:8 enabled:true scaling:off origin:(0,0) degree:0"
    echo "Set to 5120x1440@60hz"
end
