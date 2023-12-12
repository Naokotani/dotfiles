(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)          ; Disable the menu bar

(setq visible-bell t)       ; Disable error bell and replace with flash

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Binds escape to mimic default C-g keyboard-quit

(column-number-mode)        ; Gives cursor position in mode line

;; Puts Emacs customize code in seperate file. 
(setq custom-file (locate-user-emacs-file "custom-vars.el")) 
(load custom-file 'noerro 'nomessage)


(setq global-auto-revert-mode 1)  ; Revert buffers when the file changes on disc
(setq global-auto-revert-non-file-buffers 1) ; Reverts dired buffers when directories change on disc

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
				prog-mode-hook
				conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
