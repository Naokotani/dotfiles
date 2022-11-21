;; Magit
(use-package magit)

;;; Programming Languages Setup

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

;; Emmet
(use-package emmet-mode
  :hook ((sgml-mode . emmet-mode)
		(css-mode . emmet-mode)
		(js-mode . emmet-mode)))

(defun my/emmet-expand-capf ()
  (let ((bounds (bounds-of-thing-at-point 'symbol))
        (tap (thing-at-point 'symbol)))
    (list (car bounds) (cdr bounds)
          ;; Just return the symbol at point to so completion will be possible
          ;; TODO Determine if there is a less hacky option
          (lambda (string pred action) (list (thing-at-point 'symbol)))
          ;; Annotate with what emmet expands to
          ;; TODO find a way for this to show since right now
          ;; corfu doesn't display this on a single completion
          :annotation-function (lambda (str) (emmet-transform str))
          ;; Don't try to complete with emmet if there is no possible
          ;; expansion
          :predicate (not (string= (emmet-transform tap)
                                   tap))
          ;; Expand Emmet Template On Match
          :exit-function (lambda (str status)
                           (when (eql status 'finished)
                             (emmet-expand-line nil)))
          ;; Allow for other completions to follow
          :exlcusive 'no)))

(add-to-list 'completion-at-point-functions 'my/emmet-expand-capf t)
