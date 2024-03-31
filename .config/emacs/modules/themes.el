;;Faces sets default faces for variable pitch and fixed pitch as well as default text size

;; (setq modus-themes-italic-constructs t)                     ; Allows for the use of italic fonts
;; (setq modus-themes-completions '(opinionated))              ; Completion theming mimics Ivy, Helm
;; (setq modus-themes-tabs-accented t)                         ; Accent active tab
;; (setq modus-themes-mode-line '(accented borderless padded)) ; Setup mode line theming
;; (setq modus-themes-region '(bg-only))                       ; More Subtle selection background
;; (setq modus-themes-paren-match '(bold intense))             ; Matching paren highlight stands out more
;; (setq modus-themes-org-blocks 'tinted-background)           ; Allows for language specific org source block coloring
;; Org heading face size
;; (setq modus-themes-headings
;; 	'((1 . (rainbow bold 1.4))
;; 		(2 . (rainbow bold 1.3))
;; 		(3 . (rainbow bold 1.2))
;; 		(t . (semilight 1.1))))

;; (setq modus-themes-scale-headings t) ; Allow font scaling for headings
;; (load-theme 'modus-vivendi t)        ; Load dark theme by default

(use-package ef-themes
  :custom
  (ef-themes-to-toggle '(ef-duo-dark ef-deuteranopia-light))
  :config
  (load-theme 'ef-duo-dark :no-confirm))

(setq ef-themes-headings
      '((1 regular variable-pitch 5)
        (2 regular variable-pitch 3)
        (3 1.1)
        (agenda-date 1.3)
        (agenda-structure variable-pitch light 1.8)
        (t variable-pitch)))

;; Load Doom mode line and display battery 
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  ;;Add below if you want battery on laptop
  :config
  (display-battery-mode 1))

;;Install all the icons for integration into doom modeline and Dirvish
(use-package all-the-icons
  :straight t)

;; Transparency
(set-frame-parameter nil 'alpha-background 90)
(defvar nao/alpha-background 90)

(defun nao/toggle-alpha-background ()
  "Toggle alpha-background between 90 and 100."
  (interactive)
	(cond ((= nao/alpha-background 70) (setq nao/alpha-background 80))
				((= nao/alpha-background 80) (setq nao/alpha-background 90))
				((= nao/alpha-background 90) (setq nao/alpha-background 100))
				((= nao/alpha-background 100) (setq nao/alpha-background 70)))
  (set-frame-parameter nil 'alpha-background nao/alpha-background))


;;Use this to change the fringe for and background color
(set-face-attribute 'fringe nil :background "#220c20" :foreground "#414a4c")

(setq org-present-text-scale 3)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (set-face-attribute 'org-block nil :inherit 'fixed-pitch :height 180)
                 (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch) :height 180)
                 (set-face-attribute 'org-verbatim nil   :inherit '(shadow fixed-pitch) :height 180)
                 (set-face-attribute 'org-level-1 nil :font "Libre Baskerville" :height 300)
                 (set-face-attribute 'org-level-2 nil :font "Libre Baskerville" :height 240)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (set-face-attribute 'org-level-1 nil :font "Libre Baskerville" :height 240)
                 (set-face-attribute 'org-level-2 nil :font "Libre Baskerville" :height 200)
                 (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch) :height 120)
                 (set-face-attribute 'org-block nil :inherit 'fixed-pitch :height 120)
                 (set-face-attribute 'org-verbatim nil   :inherit '(shadow fixed-pitch) :height 120)
                 (org-present-show-cursor)
                 (org-present-read-write)))))
