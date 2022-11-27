;; [[file:../../../../org-roam/20221120034815-emacs.org::*Projects][Projects:1]]
(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-switch-project-action #'projectile-dired)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))
;; Projects:1 ends here
