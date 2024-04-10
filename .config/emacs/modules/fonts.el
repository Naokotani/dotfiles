(use-package fontaine)

(setq fontaine-presets
      '((regular
         ;; I keep all properties for didactic purposes, but most can be
         ;; omitted.  See the fontaine manual for the technicalities:
         ;; <https://protesilaos.com/emacs/fontaine>.
         :default-family "Fira Code retina"
         :default-weight regular
         :default-slant normal
         :default-height 120

         :fixed-pitch-family nil
         :fixed-pitch-weight nil
         :fixed-pitch-slant nil
         :fixed-pitch-height 1.0

         :fixed-pitch-serif-family nil
         :fixed-pitch-serif-weight nil
         :fixed-pitch-serif-slant nil
         :fixed-pitch-serif-height 1.0

         :variable-pitch-family "Libre Baskerville"
         :variable-pitch-weight nil
         :variable-pitch-slant nil
         :variable-pitch-height 1.3

         :mode-line-active-family nil
         :mode-line-active-weight nil
         :mode-line-active-slant nil
         :mode-line-active-height 1.0

         :mode-line-inactive-family nil
         :mode-line-inactive-weight nil
         :mode-line-inactive-slant nil
         :mode-line-inactive-height 1.0

         :header-line-family nil
         :header-line-weight nil
         :header-line-slant nil
         :header-line-height 1.0

         :line-number-family nil
         :line-number-weight nil
         :line-number-slant nil
         :line-number-height 1.0

         :tab-bar-family nil
         :tab-bar-weight nil
         :tab-bar-slant nil
         :tab-bar-height 1.0

         :tab-line-family nil
         :tab-line-weight nil
         :tab-line-slant nil
         :tab-line-height 1.0

         :bold-family nil
         :bold-slant nil
         :bold-weight bold
         :bold-height 1.0

         :italic-family nil
         :italic-weight nil
         :italic-slant italic
         :italic-height 1.0

         :line-spacing nil)
        (tutor
         :default-height 240)))

(fontaine-set-preset 'regular)
(fontaine-mode 1)
(define-key global-map (kbd "C-c f") #'fontaine-set-preset)

(set-face-attribute 'org-level-1 nil :height 240)
(set-face-attribute 'org-level-2 nil :height 200)
(set-face-attribute 'org-level-3 nil :height 180)
(set-face-attribute 'org-level-4 nil :height 200)
(set-face-attribute 'org-level-5 nil :height 200)
(set-face-attribute 'org-level-6 nil :height 200)

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

(defun nao/markdown-font-setup()
  (setq line-number-mode nil)
  (set-face-attribute 'markdown-inline-code-face nil   :inherit '(shadow fixed-pitch) :height 120)
  (set-face-attribute 'markdown-header-face-1 nil :font "Libre Baskerville" :height 240)
  (set-face-attribute 'markdown-header-face-2 nil :font "Libre Baskerville" :height 200)
  (set-face-attribute 'markdown-header-face-3 nil :font "Libre Baskerville" :height 180))

(defun nao/markdown-mode-setup ()
  (auto-fill-mode 1)
  (display-line-numbers-mode 0)
  ;; Allow variable pitch faces
  (variable-pitch-mode 1))

(defun nao/markdown-mode-visual-fill ()
        (setq visual-fill-column-width 120
              visual-fill-column-center-text t)
        (visual-fill-column-mode 1))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))


(add-hook 'markdown-mode-hook #'nao/markdown-mode-setup)
(add-hook 'markdown-mode-hook #'nao/markdown-font-setup)
(add-hook 'markdown-mode-hook #'nao/markdown-mode-visual-fill)
