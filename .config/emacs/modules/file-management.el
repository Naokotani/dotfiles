;; [[file:../../../../org-roam/20221120034815-emacs.org::*Dired][Dired:1]]
;; Dirvish
(use-package dirvish
  :custom
  (setq dirvish-mode-line-format ; it's ok to place string inside
		'(:left (file-time " " file-size " " file-modes) :right (omit yank index)))

  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dirvish-quick-access-entries
		'(("h" "~/"                                  "Home")
		  ("p" "~/pictures/"                         "Pictures")
		  ("w" "~/webDev/"                           "WebDev")
		  ("c" "~/.config/"                          "config")
		  ("s" "~/webDev/sites/"                     "sites")
		  ("P" "~/python/"                           "Python")
		  ("f" "~/documents/"                        "Documents")
		  ("d" "~/downloads/"                        "Downloads")))
  (setq dirvish-attributes
		'(vc-state subtree-state all-the-icons collapse git-msg file-size))
  (dirvish-peek-mode)
  (setq dirvish-default-layout '((0 0 0.4)))
  (setq dirvish-emerge-mo 1)
  (setq dirvish-reuse-session nil)
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
	"F" 'dirvish-toggle-fullscreen
	"f" 'dirvish-file-info-menu
	"N" 'dirvish-narrow
	"y" 'dirvish-yank-menu
	"b" 'dirvish-bookmark-jump
	"X" 'dired-ranger-move)
;; Dired:1 ends here
