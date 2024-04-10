(use-package ef-themes
  :custom
  (ef-themes-to-toggle '(ef-duo-dark ef-deuteranopia-light))
  (ef-themes-mixed-fonts)
  :config
  (load-theme 'ef-duo-dark :no-confirm))

(setq ef-themes-headings
      '((1 regular variable-pitch 5)
        (2 regular variable-pitch 3)
        (3 1.1)
        (agenda-date 1.3)
        (agenda-structure variable-pitch light 1.8)
        (t variable-pitch)))

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

(winner-mode)

(use-package spacious-padding)

;; These is the default value, but I keep it here for visiibility.
(setq spacious-padding-widths
      '( :internal-border-width 20
         :header-line-width 0
         :tab-width 0
         :left-fringe-width 20
         :mode-line-width 0
         :right-divider-width 0
         :scroll-bar-width 0
         :fringe-width 0))

;; Read the doc string of `spacious-padding-subtle-mode-line' as it
;; is very flexible and provides several examples.
(setq spacious-padding-subtle-mode-line
      `( :mode-line-active 'default
         :mode-line-inactive vertical-border))

(spacious-padding-mode 1)

;; Set a key binding if you need to toggle spacious padding.
(define-key global-map (kbd "<f8>") #'spacious-padding-mode)
