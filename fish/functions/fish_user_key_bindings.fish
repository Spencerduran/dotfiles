function fish_user_key_bindings
	for mode in insert default visual
        bind -M $mode \cf forward-char
        bind -M insert -m default jk backward-char force-repaint
        bind -M insert \e\[C true
    end
end
