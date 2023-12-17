;; Global keymaps
(global-set-key (kbd "<f5>") 'async-shell-command)
(global-set-key (kbd "<f6>") 'eshell)
(global-set-key (kbd "C-c D") 'dirvish-dispatch)
(global-set-key (kbd "C-c d") 'dirvish)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "M-w") 'hydra-window/body)
(global-set-key (kbd "<f12>") 'nao/toggle-alpha-background)

;; Allow Eat to handle pasting text
(add-hook 'eat-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map
                        (kbd "p") 'eat-yank)))

(defun nao/move-divider-right ()
		(if (windows-sharing-edge (selected-window) 'right)
				(enlarge-window-horizontally 1)
			(shrink-window-horizontally 1)))

(defun nao/move-divider-left ()
		(if (windows-sharing-edge (selected-window) 'right)
				(shrink-window-horizontally 1)
			(enlarge-window-horizontally 1)))

(defun nao/move-divider-down ()
		(if (windows-sharing-edge (selected-window) 'below)
				(enlarge-window 1)
			(shrink-window 1)))

(defun nao/move-divider-up ()
		(if (windows-sharing-edge (selected-window) 'below)
				(shrink-window 1)
			(enlarge-window 1)))

(use-package hydra)

(defhydra hydra-window (:color red
                        :hint nil)
  "
  Split: _v_ert _x_:horz
   Move: _s_wap
   Size: _H_ shrink horz _J_ shrink vert _K_ enlarge vert _L_ enlarge vert
 Frames: _df_ delete
Leaders: 'f' file 'b' buffer 'd' delete 't' Eat"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" (nao/move-divider-left))
  ("J" (nao/move-divider-down))
  ("K" (nao/move-divider-up))
  ("L" (nao/move-divider-right))
  ("|" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right)))
  ("_" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down)))
  ("tt" eat)
  ("tp" eat-project)
  ("to" eat-other-window)
  ("v" split-window-right)
  ("x" split-window-below)
  ("s" window-swap-states)
  ("tt" eat)
  ("tp" eat-project)
  ("o" delete-other-windows :exit t)
  ("ff" find-file)
  ("fo" find-file-other-window)
  ("bb" consult-buffer)
  ("bo" consult-buffer-other-window)
  ("dw" delete-window)
  ("db" kill-this-buffer)
  ("df" delete-frame :exit t)
  ("q" nil))
