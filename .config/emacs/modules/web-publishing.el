;; Simple web server
(use-package simple-httpd
  :straight t)

;; Used to maintain syntax highlighting in html exports
(use-package htmlize)

(use-package webjump
	:config
  (setq webjump-sites
        (append '(("Github" . "https://github.com/Naokotani")
                  ("Digital Ocean"   . "https://www.digitalocean.com/")
                  ("Youtube"   . "https://www.youtube.com")
                  ("Google"   . "https://www.google.com")))))

(defun nao/export-org-to-blog ()
  (interactive)
  (setq org-html-doctype "html5")
  (let ((filename (org-html-export-to-html nil nil nil t)))
   	(copy-file (concat (file-name-sans-extension filename) ".png")
               "/rsync:quizbot:/home/naokotani/bun-blog/static/images/" t)
    (copy-file filename "/rsync:quizbot:/home/naokotani/bun-blog/posts/" t)))

(defun nao/export-org-to-blog-intro ()
  (interactive)
  (setq org-html-doctype "html5")
  (let ((filename (org-html-export-to-html nil nil nil t)))
		(copy-file filename "/rsync:quizbot:/home/naokotani/bun-blog/templates/" t)))

(defun nao/insert-blog-date ()
  "Inserts the current time in RFC 2822 format inside an HTML <small> tag."
  (interactive)
  (insert "<small>")
  (insert (format-time-string "Published: %a, %d %b %Y %H:%M:%S"))
  (insert "</small>"))
