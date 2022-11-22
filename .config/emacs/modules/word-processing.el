;; [[file:../../../../org-roam/20221120034815-emacs.org::*Spell Checking][Spell Checking:1]]
;; Enables spell checking for text mode and disable for some other modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; Set spell checking to use the command line program hunspell
(setq ispell-program-name "hunspell")

(defun nao/org-ispell-ignore ()
  "Configure `ispell-skip-region-alist' for `org-mode'."
  (make-local-variable 'ispell-skip-region-alist)
  (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re)))
(add-hook 'org-mode-hook #'nao/org-ispell-ignore)
;; Spell Checking:1 ends here
