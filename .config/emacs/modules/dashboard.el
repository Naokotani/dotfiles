(use-package page-break-lines)

  ;; Simple dashboard that displays recent files and upcoming agenda items
(use-package dashboard
  :straight t
  :custom
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner 'logo)
  (dashboard-set-footer nil)
  (dashboard-banner-logo-title nil)
  (dashboard-items '((recents  . 5)
                       (agenda . 5)))
  :config
  (dashboard-setup-startup-hook))

(erc-tls :server "irc.libera.chat"
                  :port 6667
                  :nick   "Naokotani"
                  :full-name "Chris Hughes")
