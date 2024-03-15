;; Function to make Evil respect visual lines
(defun nao/evil-visual-line ()
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line))

;; Ensure Org Mode is loaded
(use-package org
  :straight t
  :hook
  ;; Make evil respect visual lines in org mode
  (org-mode . nao/evil-visual-line)
  :bind
  (("C-c a" . org-agenda)))

(setq org-agenda-span 14)

;;basic defaults
(setq org-hide-emphasis-markers t)     
(setq org-startup-with-inline-images t)

;; Setup evil for visual line mode
(setq evil-respect-visual-line-mode t)

;; Setup template for org source blocks
(setq org-structure-template-alist
      '(("el" . "src emacs-lisp")
		("js" . "src javascript")
		("css" . "src css")
		("sql" . "src sql")
		("pu" . "src plantuml :file")
		("rs" . "src rust")
		("java" . "src java")
		("html" . "src html")))

(setq org-src-block-faces 
	  '(("emacs-lisp" modus-themes-nuanced-magenta)
		("elisp" modus-themes-nuanced-magenta)
		("clojure" modus-themes-nuanced-magenta)
		("clojurescript" modus-themes-nuanced-magenta)
		("c" modus-themes-nuanced-blue)
		("c++" modus-themes-nuanced-blue)
		("sh" modus-themes-nuanced-green)
		("sql" modus-themes-nuanced-green)
		("html" modus-themes-nuanced-yellow)
		("xml" modus-themes-nuanced-yellow)
		("css" modus-themes-nuanced-red)
		("scss" modus-themes-nuanced-red)
		("python" modus-themes-nuanced-green)
		("ipython" modus-themes-nuanced-magenta)
		("javascript" modus-themes-nuanced-cyan)
		("yaml" modus-themes-nuanced-cyan)
		("conf" modus-themes-nuanced-cyan)
		("docker" modus-themes-nuanced-cyan)))

(defun nao/org-mode-setup ()
        (org-indent-mode)
        ;; Allow variable pitch faces
        (variable-pitch-mode 1)
        ;; Enables line wrapping
        (visual-line-mode 1))

(setq org-agenda-files "~/Documents/denote/agenda")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/denote/20230911T100446--todos__personal.org" "Unsorted")
         "* TODO %?\n  %i\n  %a")))

 (define-key global-map (kbd "C-c n t")
  (lambda () (interactive) (org-capture nil "t")))


(setq org-agenda-prefix-format '((agenda . " %i %?-12t% s")
							   (todo . " %i")
							   (tags . " %i")
							   (search . " %i")))

;; Gives a list of keywords for org agenda. The bottom list is used for a custom org agenda workflow buffer
(setq org-todo-keywords
'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
    (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

;; Tags for org agenda TODOs 
(setq org-tag-alist
'((:startgroup)
    ; Put mutually exclusive tags here
    (:endgroup)
    ("@board" . ?B)
    ("@home" . ?H)
    ("@work" . ?W)
    ("Agenda" . ?a)
    ("Python" . ?p)
    ("Emacs" . ?e)
    ("Publish" . ?P)
    ("Batch" . ?b)
    ("Note" . ?n)
    ("Idea" . ?i)))

;; Configure custom agenda views
(setq org-agenda-custom-commands
'(("d" "Dashboard"
    ((agenda "" ((org-deadline-warning-days 7)))
    (todo "NEXT"
    ((org-agenda-overriding-header "Next Tasks")))
    (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))
;; View only taks marked NEXT
("n" "Next Tasks"
    ((todo "NEXT"
    ((org-agenda-overriding-header "Next Tasks")))))

;; Setup buffer to display workflow
("w" "Workflow Status"
    ((todo "ACTIVE"
        ((org-agenda-overriding-header "Active Projects")
            (org-agenda-files org-agenda-files)))
    (todo "READY"
        ((org-agenda-overriding-header "Ready for Work")
            (org-agenda-files org-agenda-files)))
    (todo "PLAN"
        ((org-agenda-overriding-header "In Planning")
            (org-agenda-todo-list-sublevels nil)
            (org-agenda-files org-agenda-files)))
    (todo "WAIT"
        ((org-agenda-overriding-header "Waiting on External")
            (org-agenda-files org-agenda-files)))
    (todo "REVIEW"
        ((org-agenda-overriding-header "In Review")
            (org-agenda-files org-agenda-files)))
    (todo "BACKLOG"
        ((org-agenda-overriding-header "Project Backlog")
            (org-agenda-todo-list-sublevels nil)
            (org-agenda-files org-agenda-files)))
    (todo "COMPLETED"
        ((org-agenda-overriding-header "Completed Projects")
            (org-agenda-files org-agenda-files)))
    (todo "CANC"
        ((org-agenda-overriding-header "Cancelled Projects")
            (org-agenda-files org-agenda-files)))))))

;; Set Faces
(defun nao/org-font-setup ()
  (require 'org-faces)
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-level-1 nil :font "Libre Baskerville" :height 240)
  (set-face-attribute 'org-level-2 nil :font "Libre Baskerville" :height 200)
  (set-face-attribute 'org-level-3 nil :font "Libre Baskerville" :height 180)
  (set-face-attribute 'org-level-4 nil :font "Libre Baskerville" :height 200)
  (set-face-attribute 'org-level-5 nil :font "Libre Baskerville" :height 200)
  (set-face-attribute 'org-level-6 nil :font "Libre Baskerville" :height 200)
  (set-face-attribute 'org-block-begin-line nil :font "Fira Code retina")
  (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

;;Org Bullets provides nicer bullets for Org Mode headers and lists
(use-package org-bullets
  :custom
  (setq org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


;; Visual Fill Column provides margins for buffers
(use-package visual-fill-column)
(defun nao/org-mode-visual-fill ()
        (setq visual-fill-column-width 120
                                visual-fill-column-center-text t)
        (visual-fill-column-mode 1))

;; Org-mode hooks
(add-hook 'org-mode-hook #'nao/org-mode-setup)
(add-hook 'org-mode-hook #'nao/org-font-setup)
(add-hook 'org-mode-hook #'org-bullets-mode)
(add-hook 'org-mode-hook #'nao/org-mode-visual-fill) ; Display margins in Org buffers

(use-package org-present)

(use-package denote
  :config
  (setq denote-known-keywords '("school" "work" "personal"))
  (setq denote-infer-keywords t)
  (setq denote-directory (expand-file-name "~/Documents/denote/"))
  (setq denote-sort-keywords t)
  (setq denote-file-type nil) ; Org is the default, set others here
  (setq denote-prompts '(title keywords))
  (setq denote-excluded-directories-regexp nil)
  (setq denote-excluded-keywords-regexp nil)
  ;; Pick dates, where relevant, with Org's advanced interface:
  (setq denote-date-prompt-use-org-read-date t)
  :bind
  (("C-c n c" . denote)
   ("C-c n o" . denote-open-or-create)
   ("C-c n l" . denote-link)))
(add-to-list 'load-path "~/.config/emacs/lisp")
(eval-after-load 'ox '(require 'ox-koma-letter))
(eval-after-load 'ox-koma-letter
  '(progn
     (add-to-list 'org-latex-classes
                  '("my-letter"
                    "\\documentclass\{scrlttr2\}
     \\usepackage[english]{babel}
     \\setkomavar{frombank}{(1234)\\,567\\,890}
     \[DEFAULT-PACKAGES]
     \[PACKAGES]
     \[EXTRA]"))

     (setq org-koma-letter-default-class "my-letter")))
(eval-after-load 'ox-latex
  '(add-to-list 'org-latex-packages-alist '("AUTO" "babel" t) t))


(use-package plantuml-mode)

(setq org-plantuml-jar-path "/home/naokotani/src/plantuml.jar")
(setq plantuml-jar-path "/home/naokotani/src/plantuml.jar")
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq plantuml-default-exec-mode 'jar)
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
(setq org-src-fontify-natively t
      org-src-window-setup 'current-window ;; edit in current window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t ;; do not put two spaces on the left
      org-src-tab-acts-natively t)

