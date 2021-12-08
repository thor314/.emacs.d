;; Path adjustments, tramp miscellanea, and auth stuff

;;Sometimes the PATH shell var isn't set correctly. Use this area to modify that. Maybe worth restarting emacs (closing and re-opening) before fiddling with this. Also try =eshell/addpath=.
(setenv "PATH" (concat (getenv "PATH") ":/home/thor/.nvm/versions/node/v17.0.1/bin"))
(setq exec-path (append exec-path '("/home/thor/.nvm/versions/node/v17.0.1/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/home/thor/.cargo/bin"))
(setq exec-path (append exec-path '("/home/thor/.cargo/bin")))
(setenv "NVM_DIR" "~/.nvm")

;; Authentication and passphrases
;; [[https://www.gnu.org/software/emacs/manual/html_mono/auth.html][Auth source manual]]. In a nutshell, store passwords in =auth-sources= files in a given format:
;; - =machine mymachine login myloginname password mypassword port myport=
                                        ; ;A golden quote: "90% of Emacs users have unusual setups and the remaining 10% are really unusual".
;; [[https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources][The mastering emacs]] post on setting this up was okay.
;; [[https://jherrlin.github.io/posts/emacs-gnupg-and-pass/][This guy]]  is doing hard mode, but documents reasonably well. Don't use his pinentry strat though, it deprecated.
(setq tramp-default-method "ssh")
(setq auth-sources '("~/.authinfo.gpg"))
;; the following two lines enable GnuPG passphrase prompting in the minibuffer.
;; see the answer by Y.E.
;; Note that the pinentry package is deprecated for GnuPG >= 2.1
;; https://emacs.stackexchange.com/questions/32881/enabling-minibuffer-pinentry-with-emacs-25-and-gnupg-2-1-on-ubuntu-xenial
;; step 2, adding allow-emacs-pinentry not necessary on linux
;; redirects all Pinentry queries to the caller, so Emacs can query
;; passphrase through the minibuffer
(require 'epg)
(setq epg-pinentry-mode 'loopback)
;; store passwords in .authinfo.gpg, and get them with my-fetch-passwords.
;; See messaging.org for examples.
;; https://github.com/emacs-circe/circe/wiki/Configuration
(defun my-fetch-password (&rest params)
  """Usage: Put a line in my auth file (~/.authinfo.gpg), then load:
        (my-fetch-password :user <login> :machine <machine>) """
  (require 'auth-source)
  (let ((match (car (apply 'auth-source-search params))))
    (if match
      (let ((secret (plist-get match :secret)))
        (if (functionp secret)
          (funcall secret)
          secret))
      (error "Password not found for %S" params))))
