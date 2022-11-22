;; [[file:../../../../org-roam/20221120034815-emacs.org::*Programming Languages Setup][Programming Languages Setup:1]]
;; Rainbow brackets
(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package eglot)

;; Javascript setup
(use-package prettier-js)
(add-hook 'js-mode-hook 'eglot-ensure)
(setq js-jsx-indent-level 2)
(setq js-indent-level 2)
(setq-default tab-width 4)
(add-hook 'js-mode-hook (lambda () (setq tab-width 2)))

;; C setup
(defun nao/c-mode-keybinds ()
  (define-key c-mode-map (kbd "C-c m") 'compile))
(add-hook 'c-mode 'eglot-ensure)
(add-hook 'c-mode-hook #'nao/c-mode-keybinds)

(use-package emmet-mode
  :hook ((sgml-mode . emmet-mode)
		(css-mode . emmet-mode)
		(js-mode . emmet-mode)))
;; Programming Languages Setup:1 ends here
