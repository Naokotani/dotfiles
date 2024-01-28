(use-package projectile
  :straight t
  :init
  (projectile-mode +1)
  :config
  (setq projectile-switch-project-action #'projectile-dired)
  :bind (:map projectile-mode-map
              ("C-," . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))
