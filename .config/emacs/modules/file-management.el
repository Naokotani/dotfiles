;;Dirvish
(use-package dirvish
 :config
 ;; (setq dirvish-mode-line-format ; it's ok to place string inside
 ;;  	'(:left (" " file-time " " file-size " " file-modes) :right (omit yank index)))
 ;; (setq dirvish-header-line-format '(:left (path) :right (free-space)))
 (setq dirvish-header-line-format
      '(:left (path) :right (free-space))
      dirvish-mode-line-format
      '(:left (" "sort file-time " " file-size symlink) :right (omit yank index)))
 (setq dirvish-attributes
		'(vc-state subtree-state all-the-icons collapse git-msg file-size))
 (dirvish-peek-mode)
 (setq dirvish-default-layout '(0 0.4 0.6))
 (setq dirvish-header-line-height '(25 . 25))
 (setq dirvish-mode-line-height '(20 . 20))
 (setq dirvish-reuse-session 'resume)
 (setq dired-hide-details-mode t)
 (setq dired-listing-switches
		"-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group")
 :init
 (dirvish-override-dired-mode))

;; (add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Evil keybind integration with Dirvish
  (evil-collection-define-key 'normal 'dired-mode-map
	"h" 'dired-up-directory
  "q" 'dirvish-quit
	"l" 'dired-find-file
	"J" 'dirvish-history-jump
	"M" 'dirvish-show-media-properties
	"F" 'dirvish-layout-toggle
	"f" 'dirvish-file-info-menu
	"N" 'dirvish-narrow
	"b" 'dirvish-bookmark-jump)

;; dired options
(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)
(setq delete-by-moving-to-trash t)
(setq dired-dwim-target t)

;;Setup auto saves to save to temporary file folder, defaults to /tmp/
(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

;; Disable file locks since it's single user system this is not useful
(setq create-lockfiles nil)

(use-package 0x0)

(setq dired-auto-revert-buffer t)
