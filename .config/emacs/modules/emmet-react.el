(defun emmet-react-expand-component ()
	(interactive)
	(message (string (region-end)))
	(let ((component)
				(propList))
		(setq propList (emmet-react-get-component))
		(setq component (pop propList))
		(emmet-react-insert-component propList component)))

(defun emmet-react-wrap-component ()
	(interactive)
	(let ((str (read-string "Enter component: "))
				(propList)
				(body (buffer-substring (region-end) (region-beginning)))
				(component)
				(propPos))
		(setq propList (split-string str "\\."))
		(setq component (pop propList))
		(delete-region (region-end) (region-beginning))
		(insert (format "<%s" component))
		(js-indent-line)
		(while propList
			(insert (format " %s=\"\""(pop propList)))
			(if (not propPos)
					(progn
						(setq propPos (- (point) 1)))))
		(insert ">\n")
		(insert body)
		(insert (format "</%s>\n" component))
		(web-mode-buffer-indent)
		(cond ((eq evil-state 'visual) (evil-insert-state)))
		(if propPos
				(goto-char propPos))))

(defun emmet-react-expand-wrap-component ()
	(interactive)
	(let ((component)
				(propList))
		(setq propList (emmet-react-get-component))
		(setq component (pop propList))
		(emmet-react-insert-wrap-component propList component)))

(defun emmet-react-get-component ()
	(let ((x 1)
				(propList)
				(posOne)
				(posTwo))
		(while (> x 0)
			(setq posOne (point))
			(backward-word 1)
			(setq posTwo (point))
			(push (buffer-substring posOne posTwo) propList)
			(kill-word 1)
			(if (char-equal (char-before) ?.)
					(backward-delete-char 1)
				(setq x -1)))
		 propList))

(defun emmet-react-insert-component (propList component)
		(insert (format "<%s " component))
		(js-indent-line)
		(let ((propPos))
			(while propList
				(insert (format "%s=\"\" "(pop propList)))
				(if (not propPos)
						(setq propPos (- (point) 2))))
			(insert "/>")
			(if propPos
						(goto-char propPos))))

(defun emmet-react-insert-wrap-component (propList component)
		(insert (format "<%s " component))
		(js-indent-line)
		(let ((propPos))
			(while propList
				(insert (format "%s=\"\" "(pop propList)))
				(if (not propPos)
						(setq propPos (- (point) 2))))
			(backward-delete-char 1)
			(if (not propPos)
					(setq propPos (+ (point) 1)))
			(insert (format "></%s>" component))
			(if propPos
						(goto-char propPos))))


(define-minor-mode emmet-react-mode
  "Toggles global emmet-react-mode."
  :init-value nil   
  :global t
  :group 'emmet-react
  :lighter " emmet-react"
  :keymap
  (list (cons (kbd "M-<return>") 'emmet-react-expand-component)
				(cons (kbd "C-M-<return>") 'emmet-react-expand-wrap-component))

  (if emmet-react-mode
      (message "emmet-react-mode activated!")
    (message "emmet-react-mode deactivated!")))

(add-hook 'emmet-react-mode-hook (lambda () (message "Hook was executed!")))
(add-hook 'emmet-react-mode-on-hook (lambda () (message "emmet-react turned on!")))
(add-hook 'emmet-react-mode-off-hook (lambda () (message "emmet-react turned off!")))
