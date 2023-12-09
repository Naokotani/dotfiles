;; Magit
(use-package magit
  :bind
  (("C-x g" . magit)))

(use-package popper
  :straight t
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  :bind (("C-`"   . popper-toggle-latest)
		 ("M-`"   . popper-cycle)
		 ("C-M-`" . popper-toggle-type)))

(popper-mode)
