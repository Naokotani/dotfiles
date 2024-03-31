(use-package org)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; Sets evil keybinds for other modes
  (setq evil-want-C-u-scroll nil) ; Allows for the standard vim C-u  motion
  (setq evil-want-C-i-jump nil) ; Disable default evil jump forward in jump list
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Enables default vim keybind to delete backward
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Set up Evil for messages buffer and dashboard mode
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Evil mode for various other modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package avy)
