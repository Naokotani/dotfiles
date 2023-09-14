;; Magit
(use-package magit
  :bind
  (("C-x g" . magit)))

(use-package popper
  :straight t
  :bind (("C-`"   . popper-toggle-latest)
		 ("M-`"   . popper-cycle)
		 ("C-M-`" . popper-toggle-type))
