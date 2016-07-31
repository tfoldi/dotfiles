# $Id: bindkey.zsh,v 1.2 1995/09/01 18:34:49 hzoli Exp $
bindkey '^[[3~'  delete-char-or-list			# Delete on console
bindkey '^[[2~'  overwrite-mode				# Insert
bindkey '^[[5~'  history-beginning-search-backward	# PageUp
bindkey '^[[6~'  history-beginning-search-forward 	# PageDown
bindkey '^[[17~' accept-and-menu-complete		# F6
bindkey '^[[18~' accept-line-and-down-history		# F7
bindkey -s '^[[24~' '^X^Kexit^M'			# F12
bindkey -s '^Z'  '^[Qfg^M'
bindkey '^[[19~' describe-key-briefly			# F8
bindkey '^[[20~' where-is				# F9

case $TERM in
	con*|linux*)
bindkey '^[[1~'  beginning-of-line			# Home
bindkey '^[[4~'  end-of-line				# End
bindkey '^[[[A'  history-beginning-search-backward	# F1
bindkey '^[[[B'  history-beginning-search-forward 	# F2
bindkey '^[[[C'  history-incremental-search-backward	# F3
bindkey '^[[[D'  history-incremental-search-forward	# F4
bindkey '^[[[E'  push-line-or-edit			# F5
bindkey '^[[3~'  delete-char-or-list 
		;;
	xterm*|screen*)
setopt NO_FLOW_CONTROL
bindkey '^[[7~'  beginning-of-line			# Home (xterm)
bindkey '^[[H'   beginning-of-line			# Home (rxvt)
bindkey '^[[1~'  beginning-of-line			# Home (aterm)
bindkey   	 beginning-of-line			# Home (aterm)
bindkey '^[[8~'  end-of-line				# End (xterm)
bindkey '^[Ow'   end-of-line				# End (rxvt)
bindkey '^[[4~'  end-of-line				# End (aterm)
bindkey   end-of-line				# End (aterm)
bindkey '^[[11~' history-beginning-search-backward	# F1 (xterm)
bindkey '^[[12~' history-beginning-search-forward 	# F2 (xterm)
bindkey '^[[13~' history-incremental-search-backward	# F3 (xterm)
bindkey '^[[14~' history-incremental-search-forward	# F4 (xterm)
bindkey '^[[15~' push-line-or-edit			# F5 (xterm)
bindkey '^?'     delete-char-or-list 
bindkey  history-incremental-search-backward # ^R 
bindkey  backward-delete-char # backspace in aterm / tru64
		;;
	vt100)
bindkey '^[[1~'  beginning-of-line			# Home
bindkey '^[[4~'  end-of-line				# End
bindkey '^[[11~' history-beginning-search-backward	# F1 (xterm)
bindkey '^[[12~' history-beginning-search-forward 	# F2 (xterm)
bindkey '^[[13~' history-incremental-search-backward	# F3 (xterm)
bindkey '^[[14~' history-incremental-search-forward	# F4 (xterm)
bindkey '^[[15~' push-line-or-edit			# F5 (xterm)
		;;
esac

#bindkey '^I'     expand-or-complete-prefix		# TAB
bindkey '^[^I'   reverse-menu-complete			# ESC TAB
bindkey ' '      magic-space
bindkey '^L'     clear-screen
bindkey '^J'     self-insert				# LF
bindkey '^U'     backward-kill-line
bindkey '^f'     forward-word
bindkey '^b'     backward-word
bindkey '^/'     undo
bindkey '^x'     kill-word
bindkey '^[[^@'  beginning-of-line
bindkey '^[[e'   end-of-line
