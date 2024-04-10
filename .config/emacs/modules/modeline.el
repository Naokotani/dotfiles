;; Here I explained why `setq' sets a buffer-local value and discussed
;; why we need `setq-default' in such cases.
(setq mode-line-format nil)

(kill-local-variable 'mode-line-format)

(force-mode-line-update)

(setq-default mode-line-format
              '("%e"
                my-modeline-buffer-name
                "  "
                my-modeline-major-mode))

(defface my-modeline-background
  '((t :foreground "#7fafff" :inherit bold))
  "Face with a red background for use on the mode line.")

(defface my-modeline-background-modified
  '((t :foreground "#c48702" :inherit bold))
  "Face with a red background for use on the mode line.")

(defun my-modeline--buffer-name ()
  "Return `buffer-name' with spaces around it."
  (format " %s " (buffer-name)))

(defvar-local my-modeline-buffer-name
    '(:eval
      (when (mode-line-window-selected-p)
        (if (buffer-modified-p) 
            (propertize (my-modeline--buffer-name) 'face 'my-modeline-background-modified)
          (propertize (my-modeline--buffer-name) 'face 'my-modeline-background))))
  "Mode line construct to display the buffer name.")

(put 'my-modeline-buffer-name 'risky-local-variable t)

(defun my-modeline--major-mode-name ()
  "Return capitalized `major-mode' as a string."
  (capitalize (symbol-name major-mode)))

(defvar-local my-modeline-major-mode
    '(:eval
      (list
       (propertize (my-modeline--major-mode-name) 'face 'bold)))
  "Mode line construct to display the major mode.")

(put 'my-modeline-major-mode 'risky-local-variable t)

(mode-line-window-selected-p)

