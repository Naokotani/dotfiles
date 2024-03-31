(use-package page-break-lines)

  ;; Simple dashboard that displays recent files and upcoming agenda items
(use-package dashboard
  :straight t
  :custom
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner "/home/naokotani/Pictures/anime/ahegaoinvert.png")
  (dashboard-set-footer nil)
  (dashboard-banner-logo-title nil)
  (dashboard-items '((projects . 5)
                     (agenda . 5)
										 (recents . 5))
  :config
  (dashboard-setup-startup-hook)))
(dashboard-open)

(setq dashboard-banner-ascii "
███████╗███╗░░░███╗░█████╗░░█████╗░░██████╗
██╔════╝████╗░████║██╔══██╗██╔══██╗██╔════╝
█████╗░░██╔████╔██║███████║██║░░╚═╝╚█████╗░
██╔══╝░░██║╚██╔╝██║██╔══██║██║░░██╗░╚═══██╗
███████╗██║░╚═╝░██║██║░░██║╚█████╔╝██████╔╝
╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═════╝░
")

(defun nao/irc-connect ()
	(interactive)
	(erc-tls :server "irc.libera.chat"
					 :port 6697
					 :nick   "Naokotani"
					 :full-name "Chris Hughes"))

(setq erc-fill-column 120
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 20)

(setq erc-track-exclude '("#emacs")
      erc-track-exclude-types '("JOIN" "NICK" "QUIT" "MODE" "AWAY")
      erc-hide-list '("JOIN" "NICK" "QUIT" "MODE" "AWAY")
      erc-track-exclude-server-buffer t)

(add-hook 'erc-mode-hook 
          (lambda ()
            (setq-local corfu-auto nil)))
