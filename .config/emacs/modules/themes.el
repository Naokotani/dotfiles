;;Faces sets default faces for variable pitch and fixed pitch as well as default text size

;; Default face
(defvar nao/default-font-size 120)
(set-face-attribute 'default nil :font "Fira Code retina" :height nao/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code retina" :height nao/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "NotoSerif" :height 140)


(setq modus-themes-italic-constructs t)                     ; Allows for the use of italic fonts
(setq modus-themes-completions '(opinionated))              ; Completion theming mimics Ivy, Helm
(setq modus-themes-tabs-accented t)                         ; Accent active tab
(setq modus-themes-mode-line '(accented borderless padded)) ; Setup mode line theming
(setq modus-themes-region '(bg-only))                       ; More Subtle selection background
(setq modus-themes-paren-match '(bold intense))             ; Matching paren highlight stands out more
(setq modus-themes-org-blocks 'tinted-background)           ; Allows for language specific org source block coloring
;; Org heading face size
(setq modus-themes-headings
	'((1 . (rainbow bold 1.4))
		(2 . (rainbow bold 1.3))
		(3 . (rainbow bold 1.2))
		(t . (semilight 1.1))))

(setq modus-themes-scale-headings t) ; Allow font scaling for headings
(load-theme 'modus-vivendi t)        ; Load dark theme by default

;; Load Doom mode line and display battery 
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config
  (display-battery-mode 1))

;;Install all the icons for integration into doom modeline and Dirvish
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
