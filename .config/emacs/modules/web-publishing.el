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

(use-package webjump
	:config
  (setq webjump-sites
        (append '(("Github" . "https://github.com/")
                  ("Digital Ocean"   . "https://www.digitalocean.com/")
                  ("Youtube"   . "https://www.youtube.com")
                  ("Google"   . "https://www.google.com"))
                webjump-sample-sites)))

