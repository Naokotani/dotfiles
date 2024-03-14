(defun nao/configure-client ()
  ;; Default face
  (defvar nao/default-font-size 120)
  (set-face-attribute 'default nil :font "Fira Code" :height nao/default-font-size)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "Fira Code" :height nao/default-font-size)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "NotoSerif" :height 180)

  ;Get Exec Path from bash shell
  (use-package exec-path-from-shell)
  (exec-path-from-shell-initialize))

(add-hook 'after-make-frame-functions #'nao/configure-client)
