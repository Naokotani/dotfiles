;; Global keymaps
(global-set-key (kbd "<f5>") 'async-shell-command)
(global-set-key (kbd "<f6>") 'eshell)
(global-set-key (kbd "C-c D") 'dirvish-dispatch)
(global-set-key (kbd "C-c d") 'dirvish)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "M-w") 'hydra-window/body)
(global-set-key (kbd "<f12>") 'nao/toggle-alpha-background)
(global-set-key (kbd "<f8>") 'erc-switch-to-buffer)
(global-set-key (kbd "C-x l") 'previous-buffer)
(global-set-key (kbd "C-x h") 'next-buffer)
(global-set-key (kbd "C-x j") 'hydra-buffer/body)
(global-set-key (kbd "C-c j") 'webjump)
(global-set-key (kbd "C-c C-j") 'webjump)
(global-set-key (kbd "M-j") 'nao/transpose-line-down)
(global-set-key (kbd "M-k") 'nao/transpose-line-up)
(define-key evil-window-map "u" 'winner-undo)
(define-key evil-window-map "\C-u" 'winner-undo)
(define-key evil-window-map "C-u" 'winner-undo)
(define-key prog-mode-map (kbd "C-c C-o") 'browse-url-at-point)

(defun my-org-agenda-mode-hook ()
  (local-set-key (kbd "C-j") 'org-agenda-next-line)
  (local-set-key (kbd "C-k") 'org-agenda-previous-line))

(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-hook)

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

(defhydra hydra-buffer (:color red :hint nil)
	"
_j_ previous buffer _k_ last buffer _i_buffer _b_ switch buffer
_o_ buffer other window _x_ kill buffer _s_cratch _m_essages"

	("j" previous-buffer)
	("k" next-buffer)
	("i" ibuffer)
	("b" consult-buffer)
	("o" consult-buffer-other-window)
	("x" kill-buffer)
	("s" (switch-to-buffer "*scratch*"))
	("m" (switch-to-buffer "*Messages*"))
  ("H" (nao/move-divider-left))
  ("J" (nao/move-divider-down))
  ("K" (nao/move-divider-up))
  ("L" (nao/move-divider-right))
  ("q" nil))

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


(defun nao/transpose-line-down ()
	"Transpose the current line down and move cusror to line where it moved"
	(interactive)
	(next-line 1)
	(transpose-lines 1)
	(previous-line 1))

(defun nao/transpose-line-up ()
	"Transpose the current line up and move cusror to line where it moved"
	(interactive)
	(transpose-lines 1)
	(previous-line 2))
