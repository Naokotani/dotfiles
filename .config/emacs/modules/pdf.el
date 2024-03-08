(use-package pdf-tools)
(pdf-loader-install)

(use-package auctex
	:ensure t)

(require 'auctex)

(setq org-export-date-timestamp-format "%B %d, %y")

(setq TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "PDF Tools")
     (output-html "xdg-open")))
