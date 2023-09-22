;; Rainbow brackets
(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

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

;; Java Setup
(use-package eglot-java)
(defun nao/java-mode-keybinds ()
  (define-key java-mode-map (kbd "C-c m c") 'compile)
  (define-key java-mode-map (kbd "C-c m m") 'recompile))
(add-hook 'java-mode-hook 'eglot-java-mode)
(add-hook 'java-mode-hook #'nao/java-mode-keybinds)

(use-package emmet-mode
  :config
  (setq emmet-move-cursor-between-quotes t)
  :hook ((sgml-mode . emmet-mode)
        (css-mode . emmet-mode)
        (web-mode . emmet-mode)
        (js-mode . emmet-mode)))

(use-package web-mode
  :config
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))
