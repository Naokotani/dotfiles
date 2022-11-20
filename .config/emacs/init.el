;; -*- lexical-binding: t; -*-

;;;Basic defaults

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)          ; Disable the menu bar

(setq visible-bell t)       ; Disable error bell and replace with flash

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Binds escape to mimic default C-g keyboard-quit

(column-number-mode)        ; Gives cursor position in mode line

;; Puts Emacs customize code in seperate file. 
(setq custom-file (locate-user-emacs-file "custom-vars.el")) 
(load custom-file 'noerro 'nomessage)


(global-auto-revert-mode 1)  ; Revert buffers when the file changes on disc
(setq global-auto-revert-non-file-buffers t) ; Reverts dired buffers when directories change on disc

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;Setup auto saves to save to temporary file folder, defaults to /tmp/

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Package Management

;; Straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el for use-package expressions
(straight-use-package 'use-package)

;; Tell straight.el to use use-package expressions
(setq straight-use-package-by-default t)

;;; Evil Mode

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; Sets evil keybinds for other modes
  (setq evil-want-C-u-scroll t) ; Allows for the standard vim C-u  motion
  (setq evil-want-C-i-jump nil) ; Disable default evil jump forward in jump list
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;; Enables default vim keybind to delete backward
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Set up Evil for messages buffer and dashboard mode
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Evil mode for various other modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;;;Theming

;;Faces sets default faces for variable pitch and fixed pitch as well as default text size

;; Default face
(defvar nao/default-font-size 120)
(set-face-attribute 'default nil :font "Fira Code retina" :height nao/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code retina" :height nao/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "NotoSerif" :height 140)


(setq modus-themes-italic-constructs t)                     ; Allows for the use of italic fonts
(setq modus-themes-completions '(opinionated))              ; Completition theming mimics Ivy, Helm
(setq modus-themes-tabs-accented t)                         ; Accent active tab
(setq modus-themes-mode-line '(accented borderless padded)) ; Setup modeline theming
(setq modus-themes-region '(bg-only))                       ; More Sublte selection background
(setq modus-themes-paren-match '(bold intense))             ; Matching paren highlight stands out more
(setq modus-themes-org-blocks 'tinted-background)           ; Allows for language specifc org source block coloring
;; Org heading face size
(setq modus-themes-headings
    '((1 . (rainbow bold 1.4))
        (2 . (rainbow bold 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))


(setq modus-themes-scale-headings t) ; Allow font scaling for headings
(load-theme 'modus-vivendi t)        ; Load dark theme by default

;; Load Doom modeline and display battery 
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (display-battery-mode 1))

;;Install all the icons for integration into doom modeline and dirvish
(use-package all-the-icons
  :straight t)

;; Install popper to create pop up windows for shells/terminals
(use-package popper
  :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
		'("^\\*eshell.*\\*$" eshell-mode ;eshell as a popup
		  "^\\*shell.*\\*$"  shell-mode  ;shell as a popup
		  "^\\*term.*\\*$"   term-mode   ;term as a popup
		  "^\\*vterm.*\\*$"  vterm-mode  ;vterm as a popup
          ))
  (popper-mode +1)
  (popper-echo-mode +1))

;;;Completion

;; Which key package gives hints for key chords
(use-package which-key)


;;; Spell Checking

;; Enables spell checking for text mode and disable for some other modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; Set spell checking to use the command line program hunspell
(setq ispell-program-name "hunspell")

(defun nao/org-ispell-ignore ()
  "Configure `ispell-skip-region-alist' for `org-mode'."
  (make-local-variable 'ispell-skip-region-alist)
  (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re)))
(add-hook 'org-mode-hook #'nao/org-ispell-ignore)

;; Vertico offers mini buffer completion for M-x, open file, and other comamnds.
(use-package vertico
  :straight (:files (:defaults "extensions/*")) ; Must explicity load extentions folder (directory etc.)
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;;enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t))

; vim like keybinds in completion minibuffer
(with-eval-after-load 'evil
  (define-key vertico-map (kbd "C-j") 'vertico-next)
  (define-key vertico-map (kbd "C-k") 'vertico-previous)
  (define-key vertico-map (kbd "M-h") 'vertico-directory-up))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
	#'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Smarter fuzzy finding in completion buffers
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Completion engine for code completion etc. 
(use-package corfu
  ;; Optional customizations
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion without keybind
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  :hook ((prog-mode . corfu-mode)
	 (shell-mode . corfu-mode)
	 (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-excluded-modes'.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle' globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

;; Example configuration for Consult
;; Adds practical commands to the completioni buffer
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key (kbd "M-.")
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
)

;; Embark

(use-package embark
  :straight t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.

(use-package embark-consult
  :straight t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;;; Dired

;; Dirvish
(use-package dirvish
  :custom
  (setq dirvish-mode-line-format ; it's ok to place string inside
		'(:left (file-time " " file-size " " file-modes) :right (omit yank index)))
  
  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dirvish-quick-access-entries
		'(("h" "~/"                                  "Home")
		  ("p" "~/pictures/"                         "Pictures")
		  ("w" "~/webDev/"                           "WebDev")
		  ("c" "~/.config/"                          "config")
		  ("s" "~/webDev/sites/"                     "sites")
		  ("P" "~/python/"                           "Python")
		  ("f" "~/documents/"                        "Documents")
		  ("d" "~/downloads/"                        "Downloads")))
  (setq dirvish-attributes
		'(vc-state subtree-state all-the-icons collapse git-msg file-size))
  (dirvish-peek-mode)
  (setq dirvish-default-layout '((0 0 0.4)))
  (setq dirvish-emerge-mo 1)
  (setq dirvish-reuse-session nil)
  (setq dired-hide-details-mode t)
  (setq dired-listing-switches
		"-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group")
  :init
  (dirvish-override-dired-mode))

  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "q" 'dirvish-quit
    "l" 'dired-find-file
    "J" 'dirvish-history-jump
    "M" 'dirvish-media-properties
    "F" 'dirvish-toggle-fullscreen
    "f" 'dirvish-file-info-menu
    "N" 'dirvish-narrow
    "y" 'dirvish-yank-menu
    "b" 'dirvish-bookmark-jump
    "X" 'dired-ranger-move)

;;; Git

;; Magit
(use-package magit)

;;; Programming Languages Setup

;; Rainbow brackets
(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package eglot)

;; Javascript setup
(use-package prettier-js)
(add-hook 'js-mode-hook 'eglot-ensure)
(setq js-jsx-indent-level 2)
(setq js-indent-level 2)
(setq-default tab-width 4)
(add-hook 'js-mode-hook (lambda () (setq tab-width 2)))

;; C setup
(defun nao/c-mode-keybinds ()
  (define-key c-mode-map (kbd "C-c m") 'compile))
(add-hook 'c-mode 'eglot-ensure)
(add-hook 'c-mode-hook #'nao/c-mode-keybinds)



(use-package emmet-mode
  :hook ((sgml-mode . emmet-mode)
		(css-mode . emmet-mode)
		(js-mode . emmet-mode)))

;;; Org Mode

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

(use-package page-break-lines)

;; Simple dashboard that displays recent files and upcoming agenda items
(use-package dashboard
  :straight t
  :custom
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner 'logo)
  (dashboard-set-footer nil)
  (dashboard-banner-logo-title nil)
  (dashboard-items '((recents  . 5)
                     (agenda . 5)))
  :config
  (dashboard-setup-startup-hook))
