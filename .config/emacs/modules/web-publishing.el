;; [[file:../../../../org-roam/20221120034815-emacs.org::*Website Publishing][Website Publishing:1]]
(setq org-html-validation-link nil            ;; Don't show validation link

	  org-html-head-include-scripts nil       ;; Use our own scripts
	  org-html-preamble nil
	  org-html-postamble nil
	  org-html-head-include-default-style nil) ;; Use our own styles

;; Simple web server
(use-package simple-httpd
  :straight t)

;; Used to maintain syntax highlighting in html exports
(use-package htmlize)
;; Website Publishing:1 ends here
