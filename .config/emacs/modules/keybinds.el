(global-set-key (kbd "<f5>") 'async-shell-command)
(global-set-key (kbd "<f6>") 'eshell)
(global-set-key (kbd "C-c D") 'dirvish-dispatch)
(global-set-key (kbd "C-c d") 'dirvish)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "M-w") 'hydra-window/body)

;; Allow Eat to handle pasting text
(add-hook 'eat-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map
                        (kbd "p") 'eat-yank)))

(use-package hydra)

(defhydra hydra-window (:color red
                        :hint nil)
  "
 Split: _v_ert _x_:horz
  Move: _s_wap
Frames: _f_rame new  _df_ delete
  Misc: _m_ark _a_ce  _u_ndo  _r_edo"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" shrink-window-horizontally)
  ("J" shrink-window)
  ("K" enlarge-window)
  ("L" enlarge-window-horizontally)
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
  ("s" window-swap-states)
  ("tt" eat)
  ("tp" eat-project)
  ;; winner-mode must be enabled
  ("o" delete-other-windows :exit t)
  ("ff" find-file)
  ("fo" find-file-other-window)
  ("bb" consult-buffer)
  ("bo" consult-buffer-other-window)
  ("dw" delete-window)
  ("db" kill-this-buffer)
  ("df" delete-frame :exit t)
  ("q" nil)
  ("m" headlong-bookmark-jump))
