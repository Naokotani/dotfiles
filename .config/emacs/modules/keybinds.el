(global-set-key (kbd "<f5>") 'async-shell-command)
(global-set-key (kbd "<f6>") 'eshell)
(global-set-key (kbd "C-c D") 'dirvish-dispatch)
(global-set-key (kbd "C-c d") 'dirvish)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'consult-buffer)

;; Allow Eat to handle pasting text
(add-hook 'eat-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map
                        (kbd "p") 'eat-yank)))
