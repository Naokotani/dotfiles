;; [[file:../../../org-roam/20221120034815-emacs.org::*Package management and load modules][Package management and load modules:1]]
;; -*- lexical-binding: t; -*-

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

;;; Load Modules
(require 'find-lisp)

;; First load modules that are required as dependencies, evil mode in this case for keybinds
(mapcar (lambda (fn)
		  (load (file-name-sans-extension fn)))
		(find-lisp-find-files "~/.config/emacs/early-modules" "\\.el\\'"))

;;Then load the rest
(mapcar (lambda (fn)
		  (load (file-name-sans-extension fn)))
		(find-lisp-find-files "~/.config/emacs/modules" "\\.el\\'"))
;; Package management and load modules:1 ends here
