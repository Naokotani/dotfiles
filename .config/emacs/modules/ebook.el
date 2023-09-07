(use-package nov
	:config
    (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
	(setq nov-text-width 80) 
	(setq nov-text-width t)
	(setq visual-fill-column-center-text t))

(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.2))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)
