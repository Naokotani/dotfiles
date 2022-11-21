;; -*- lexical-binding: t; -*-

;;; Package Management

;; Straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el for use-package expressions
(straight-use-package 'use-package)

;; Tell straight.el to use use-package expressions
(setq straight-use-package-by-default t)

(require 'find-lisp)

(mapcar (lambda (fn) (load (file-name-sans-extension fn))) (find-lisp-find-files "~/.dotfiles/.config/emacs/early-modules" "\\.el\\'"))

(mapcar (lambda (fn) (load (file-name-sans-extension fn))) (find-lisp-find-files "~/.dotfiles/.config/emacs/modules" "\\.el\\'"))
