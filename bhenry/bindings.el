;;paredit keybindings that work in terminal and client
(global-set-key "\C-c0" 'paredit-forward-slurp-sexp)
(global-set-key "\C-c9" 'paredit-backward-slurp-sexp)
(global-set-key "\C-c]" 'paredit-forward-barf-sexp)
(global-set-key "\C-c[" 'paredit-backward-barf-sexp)

;;other bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-x N") 'nrepl-jack-in)
(global-set-key (kbd "C-x M-n") 'nrepl-jack-in)
(global-set-key (kbd "C-x B") 'projectile-find-file)
(global-set-key (kbd "C-x T") 'ns-toggle-fullscreen)

;;change windows
(global-set-key [s-left] 'windmove-left) 
(global-set-key [s-right] 'windmove-right) 
(global-set-key [s-up] 'windmove-up) 
(global-set-key [s-down] 'windmove-down)

;;change windows in terminal
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;mouse movements
(global-set-key (kbd "<mouse-4>") 'down-slightly)
(global-set-key (kbd "<mouse-5>") 'up-slightly)

