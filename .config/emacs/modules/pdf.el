(use-package pdf-tools)
(pdf-loader-install)

(use-package auctex
	:ensure t)

(require 'tex)

(setq org-export-date-timestamp-format "%B %d, %y")

(add-to-list 'TeX-view-program-list '("Zathura" "zathura %o"))

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

(with-eval-after-load 'ob
  ;; Optional for syntax highlight of napkin-puml src block.
  ;; (require 'plantuml)
  (use-package ob-napkin))
