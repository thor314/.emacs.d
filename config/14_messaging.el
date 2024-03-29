;; [[https://github.com/emacs-circe/circe/wiki/Tracking][tracking]] - circe get buffer attention, cycle with C-c C-SPC
(use-package tracking
  :defer 15
  :bind ("C-r SPC" . tracking-next-buffer)
  :config
  (setq tracking-faces-priorities '(all-the-icons-pink
                                     all-the-icons-lgreen
                                     all-the-icons-lblue))
  (setq tracking-frame-behavior nil))
;; [[https://github.com/zevlg/telega.el][Telega]] - telegram client
;; installation guide
;; verify all dependencies, or expect to discover them in the cmake step: [[https://zevlg.github.io/telega.el/][Telega Manual (v0.7.018)]]
;; cd ~/.emacs.d && git clone https://github.com/tdlib/td.git
;; cd ~/.emacs.d/td
;; mkdir build && cd build
;; this will reveal missing dependencies
;; cmake ../
;; # use as many cores as available, takes a couple mins
;; make -j4
;; sudo make install
;; c0d3
(use-package telega
  :commands (telega)
  :bind ("C-r T" . telega)
  :defer 15)
(setq telega-user-use-avatars nil
  telega-use-tracking-for '(any pin unread)
  telega-emoji-use-images t
  telega-completing-read-function #'ivy-completing-read
  telega-msg-rainbow-title nil
  telega-chat-fill-column 75)
;; [[https://github.com/emacs-circe/circe][Circe]], the IRC client. Relies on a irc daemon like [[https://www.bitlbee.org/user-guide.html][bitlbee]]
;; Circe [[https://www.nongnu.org/circe/][homepage]].
;; Experiment. Want: Signal, Telegram, Discord all in Emacs.
;; May have to install [[https://zoomadmin.com/HowToInstall/UbuntuPackage/inetutils-inetd][inetutils-inetd]].
(use-package circe
  :defer t
  :commands circe
  :config
  (setf circe-network-options
    `(("Libera"
        :host "irc.eu.libera.chat"
        :tls t
        :nick "cryptograthor"
        :pass ,(my-fetch-password :user "cryptograthor" :machine "irc.libera.chat")
        :port "6697"
        ;; the following prompts for password
        :channels ("#emacs")
        )
       ("Bitlbee"
         :host "localhost"
         :nick "cryptograthor"
         ;; :tls t ; stops me from connecting, idk why
         :port "6667"))))

(setq lui-flyspell-p t
  lui-fill-column 75
  lui-time-stamp-format "[%H:%M:%S]"
  lui-time-stamp-position 'right)
;; how to get the following to load on entering circe?
;; the following not loading password.
                                        ;(setq circe-mode-hook nil)
;;:nickserv-password ,(my-fetch-password :user "cryptograthor" :machine "bitlbee")




;; get desktop notification for buffers in 'tracking-buffers
                                        ;(use-package circe-notifications)
                                        ;(add-hook 'circe-server-connected-hook 'enable-circe-notifications)
;;(eval-after-load "circe-notifications"
;;'(setq circe-notifications-watch-strings
;;    '("people" "you" "like" "to" "hear" "from")))
