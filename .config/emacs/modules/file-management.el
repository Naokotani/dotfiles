;; Dirvish
(setq dired-dwim-target t)

(use-package dirvish
  :custom
  (dirvish-quick-access-entries
		'(("h" "~/" "Home")
		  ("H" "/mnt/c/Users/mifka" "Windows Home")
		  ("e" "~/.config/emacs/" "Emacs user directory")
		  ("w" "~/WebDev/" "WebDev")
		  ("m" "~/.dotfiles/.config/emacs/modules/" "modules")
		  ("c" "~/.config/" "config")
		  ("d" "~/Downloads/" "Downloads")))
  :config
  (setq dirvish-mode-line-format ; it's ok to place string inside
		'(:left (file-time " " file-size " " file-modes) :right (omit yank index)))
  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dirvish-attributes
		'(vc-state subtree-state all-the-icons collapse git-msg file-size))
  (dirvish-peek-mode)
  (setq dirvish-default-layout '(0 0.4 0.6))
  (setq dirvish-header-line-height '(25 . 25))
  (setq dirvish-mode-line-height '(25 . 25))
  (setq dirvish-reuse-session 'resume)
  (setq dired-hide-details-mode t)
  (setq dired-listing-switches
		"-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group")
  :init
  (dirvish-override-dired-mode))

;; Evil keybind integration with Dirvish
  (evil-collection-define-key 'normal 'dired-mode-map
	"h" 'dired-up-directory
	"q" 'dirvish-quit
	"l" 'dired-find-file
	"J" 'dirvish-history-jump
	"M" 'dirvish-media-properties
	"F" 'dirvish-layout-toggle
	"f" 'dirvish-file-info-menu
	"N" 'dirvish-narrow
	"y" 'dirvish-yank-menu
	"b" 'dirvish-bookmark-jump
	"X" 'dired-ranger-move)
