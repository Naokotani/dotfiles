;; Magit
(use-package magit
  :bind
  (("C-x g" . magit)))

;;define list of git projects
(defvar nao/git-projects '("~/Documents/denote" "~/.dotfiles"))

(defun nao/magit-status-select-project ()
  "Prompt the user to select a project from the list and call nao/magit-status-for-project."
  (interactive)
  (let ((project (completing-read "Select a project: " nao/git-projects)))
    (nao/magit-status-for-project project)))

(defun nao/magit-status-for-project (project)
  "Switch to PROJECT directory and display its Git status."
  (cd project)
  (magit-status))
