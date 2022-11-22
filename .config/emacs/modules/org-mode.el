;; [[file:../../../../org-roam/20221120034815-emacs.org::*Org Mode][Org Mode:1]]
;; Ensure Org Mode is loaded
(use-package org
  :straight t)

;;Basic defaults
(setq org-hide-emphasis-markers t)     
(setq org-startup-with-inline-images t)

;; Setup template for org source blocks
(setq org-structure-template-alist
	'(("el" . "src emacs-lisp")))

(defun nao/org-mode-setup ()
        (org-indent-mode)
		;; Allow variable pitch faces
        (variable-pitch-mode 1)
		;; Enables line wrapping
        (visual-line-mode 1))

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

;;View tasks based on tags
("W" "Work Tasks" tags-todo "+@work-@home-@Lock-@board")
("L" "Lockraid Tasks" tags-todo "+@Lock-@home-@work-@board")
("H" "Home Tasks" tags-todo "+@home-@Lock-@work-@board")
("B" "Home Tasks" tags-todo "+@board-@home-@Lock-@work")

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
  (set-face-attribute 'org-level-1 nil :font "Inter" :height 200)
  (set-face-attribute 'org-level-2 nil :font "Inter" :height 180)
  (set-face-attribute 'org-level-3 nil :font "Inter" :height 160)
  (set-face-attribute 'org-level-4 nil :font "Inter" :height 140)
  (set-face-attribute 'org-level-5 nil :font "Inter" :height 140)
  (set-face-attribute 'org-level-6 nil :font "Inter" :height 140)
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


;; Org Roam is a Zeitelkasten method note taking package
(use-package org-roam
  :straight t
  :demand t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam") ; Tell Roam where to store files 
  (org-roam-completion-everywhere t); Enagle Roam caputre template in all buffers
  :bind (("C-c n l" . org-roam-buffer-toggle) ; Not entirely sure what this does
         ("C-c n f" . org-roam-node-find)     ; Find specific node, if it doesn't exist, create it
         ("C-c n i" . org-roam-node-insert)   ; Insert link to a node
         ("C-c n I" . org-roam-node-insert-immediate) ; Insert highlighted word as node
         ("C-c n p" . my/org-roam-find-project) ; Find nodes with the project tag
         ("C-c n t" . my/org-roam-capture-task) ; capture a todo and insert into node
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
		 ;;Navigate org roam dailies
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; Build the agenda list the first time for the session
(my/org-roam-refresh-agenda-list)

(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "Project")
   nil
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :unnarrowed t))))

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "Project"))
                     :templates '(("p" "project" plain "** TODO %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks"))))))

;; When TODOs are changed to the complete state move the to the roam daily node for that day
(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep t) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
          '(("t" "tasks" entry "%?"
             :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (my/org-roam-copy-todo-to-today))))
;; Org Mode:1 ends here
