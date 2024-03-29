(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(use-package prettier-js)
(setq js-jsx-indent-level 2)
(setq js-indent-level 2)
(setq js-switch-indent-offset js-indent-level)
(setq-default tab-width 2)
(add-hook 'js-mode-hook (lambda () (setq tab-width 2)))
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-base-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)

(add-hook 'rust-mode-hook
          (lambda () (set (make-local-variable 'compile-command) "npx tsc")))

;; Typescript
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts?\\'" . typescript-ts-mode))

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

(add-hook 'js-jsx-mode 'emmet-react-mode)
(add-hook 'svelte-mode 'emmet-react-mode)

(use-package web-mode
  :config
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(electric-pair-mode)

;;Rust
(use-package rust-mode
	:config
	(setq rust-format-on-save nil)
	(add-to-list 'eglot-server-programs
							 '((rust-ts-mode rust-mode) .
								 ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))

(add-hook 'rust-mode-hook
          (lambda ()
						(eglot-ensure)
						(setq indent-tabs-mode nil)))

(add-hook 'rust-mode-hook
          (lambda () (set (make-local-variable 'compile-command) "cargo build")))


(use-package yasnippet)
(use-package yasnippet-snippets)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; Common lisp setup
(use-package slime
	:config
	(setq inferior-lisp-program "sbcl"))

(use-package svelte-mode)
(add-to-list 'eglot-server-programs '((svelte-mode) "svelteserver" "--stdio"))
(add-hook 'svelte-mode-hook 'eglot-ensure)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point-max)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(use-package yaml-pro)
