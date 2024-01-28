(straight-use-package
 '(eat :type git
       :host codeberg
       :repo "akib/emacs-eat"
       :files ("*.el" ("term" "term/*.el") "*.texi"
               "*.ti" ("terminfo/e" "terminfo/e/*")
               ("terminfo/65" "terminfo/65/*")
               ("integration" "integration/*")
               (:exclude ".dir-locals.el" "*-tests.el"))))

;; Emacs follows the working directory in Eat
(setq eat-enable-directory-tracking t)

(straight-use-package '(chatgpt
  :host github :repo "joshcho/ChatGPT.el" :files ("dist" "*.el")))
