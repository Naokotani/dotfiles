(use-package pdf-tools)
(pdf-loader-install)

(use-package auctex
	:ensure t)

(require 'tex)

(setq org-export-date-timestamp-format "%B %d, %y")

(add-to-list 'TeX-view-program-list '("Zathura" "zathura %o"))

(setq TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open")))

(with-eval-after-load 'ob
  ;; Optional for syntax highlight of napkin-puml src block.
  ;; (require 'plantuml)
  (use-package ob-napkin))
