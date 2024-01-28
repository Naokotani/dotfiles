(defvar emmet-react-auto-indent t
			"Automatically indents buffer after wrapping with emmet-react-wrap-component
Setting it to nil will only indent the line where the component is inserted.")

(defvar emmet-react-prop-pair "\"\"" "
The pair that follows a prop after it is inserted
The value should be set to a string that is a pair that will follow a prop name.
For example '{}'.")

(defun emmet-react-expand-component ()
	"Expands a shorthand of a component with props
Write the shorthand starting with the component name and then seperate the props
with periods in the follow form 'Foo.bar.baz'. This will exapand to
<Foo bar='' baz='' />."
	(interactive)
	(message (string (region-end)))
	(let ((component)
				(propList))
		(setq propList (emmet-react-get-component))
		(setq component (pop propList))
		(emmet-react-insert-component propList component)))

(defun emmet-react-wrap-component ()
	"Wraps highlighted code in a component.
If you want to add props to the component seperate them with periods and they
will be automatically seperated. For example Foo.bar.baz will be expanded to
<Foo bar='' baz''></Foo> and the cursor will be moved between the quotes after
baz"
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
			(insert (format " %s=%s"
											(pop propList)
											emmet-react-prop-pair))
			(if (not propPos)
						(setq propPos (- (point) 1))))
		(insert ">\n")
		(insert body)
		(insert (format "</%s>\n" component))
		(if emmet-react-auto-indent
				(web-mode-buffer-indent))
		(cond ((eq evil-state 'visual) (evil-insert-state)))
		(if propPos
				(goto-char propPos))))

(defun emmet-react-expand-wrap-component ()
	"Generates a wrapping style jsx component with props
This function is not used to wrap highlighted text, it simply generates the
component. For example 'Foo.bar.baz' will expand to <Foo bar='' baz=''></Foo>.
To wrap text use the function 'emmet-react-wrap-component'"
	(interactive)
	(let ((component)
				(propList))
		(setq propList (emmet-react-get-component))
		(setq component (pop propList))
		(emmet-react-insert-wrap-component propList component)))

(defun emmet-react-get-component ()
	"Deletes shorthand component text and returns 'propList'
'propList' is a list of containing a jsx component name and its props."
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
	"Inserts a jsx component and its props.
'propList' is a list of prop names and 'component' is a string that should
be the name of a jsx component. After inserting, it will move to cursor to
the first prop."
		(insert (format "<%s " component))
		(js-indent-line)
		(let ((propPos))
			(while propList
				(insert (format "%s=%s "
												(pop propList)
												emmet-react-prop-pair))
				(if (not propPos)
						(setq propPos (- (point) 2))))
			(insert "/>")
			(if propPos
						(goto-char propPos))))

(defun emmet-react-insert-wrap-component (propList component)
	"Inserts a jsx wrap component and its props
'propList' is a list of prop names and 'component' is a string that should
be the name of a jsx component. After inserting, it will move to cursor to
the first prop."
	(insert (format "<%s " component))
		(js-indent-line)
		(let ((propPos))
			(while propList
				(insert (format "%s=%s "
												(pop propList)
												emmet-react-prop-pair))
				(if (not propPos)
						(setq propPos (- (point) 2))))
			(backward-delete-char 1)
			(if (not propPos)
					(setq propPos (+ (point) 1)))
			(insert (format "></%s>" component))
			(if propPos
						(goto-char propPos))))

(define-minor-mode emmet-react-mode
  "Toggles global emmet-react-mode.
emmet-react-mode is desgined as a simple addition to the emmet-mode that
imporves the way in which jsx components are handled. It will work as a
stand alone mode that doesn't have emmet-mode as a dependency."
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
