;;; emacs.d/init.el --- Thor Kamphefner's emacs config orchestrator
;;; Commentary:
;; I opt for a literate set-up, modularized into several files.
;; Modularity to more quickly get in and out of the right spot.
;; Literate to document the config unobtrusively.

;;; Code:
;; https://blog.d46.us/advanced-emacs-startup/
(defun tk/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds"
      (float-time
        (time-subtract after-init-time before-init-time)))
    gcs-done))
;; get default time: emacs -q --eval='(message "%s" (emacs-init-time))'
;; also, check out this startup profiler when optimizing: https://github.com/jschaf/esup
(add-hook 'emacs-startup-hook 'tk/display-startup-time)

;; Get package repositories
(require 'package)
;;(require 'cl-lib) ; not currently needed
;; NB! If a package cannot be found, try Mx package-refresh-contents!
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; nice package manager fren, would be shame if someone came along n =used= it
;; Update package archives and get use-package
;; https://github.com/jwiegley/use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents) ; download package-archive descriptions
  (package-install 'use-package)) ; to be used in place of package

;; Install packages automatically on startup, if packages not already present
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Autocompile source files on save, use latest version available
;; https://github.com/emacscollective/auto-compile
(use-package auto-compile
  ;; reduce risk of loading outdated bytecode
  :config (setq load-prefer-newer t)
  (auto-compile-on-save-mode t)
  (auto-compile-on-load-mode t))

;; consider automatic package updates: auto-package-update https://github.com/rranelli/auto-package-update.el
;; why not used: not that important

;; general config files live in ./config. Tangle these files, then remove the *.el artifacts after loading.
(org-babel-load-file "~/.emacs.d/config/tk_functions.org")
(org-babel-load-file "~/.emacs.d/config/general.org")
(org-babel-load-file "~/.emacs.d/config/ivy.org")
(org-babel-load-file "~/.emacs.d/config/smartparens.org")
(org-babel-load-file "~/.emacs.d/config/misc_packages.org")
(org-babel-load-file "~/.emacs.d/config/programming.org")
(org-babel-load-file "~/.emacs.d/config/text.org")
(org-babel-load-file "~/.emacs.d/config/org_config.org")
;(org-babel-load-file "~/.emacs.d/config/experimental.org")
(org-babel-load-file "~/.emacs.d/config/global_keybinds.org")
(org-babel-load-file "~/.emacs.d/config/secret.org")
(org-babel-load-file "~/.emacs.d/config/org_templates.org")
(org-babel-load-file "~/.emacs.d/config/messaging.org")
;; languages
(org-babel-load-file "~/.emacs.d/config/lang/rust.org")
(org-babel-load-file "~/.emacs.d/config/lang/sh.org")
(org-babel-load-file "~/.emacs.d/config/lang/elisp.org")

;; clean up the *.el artifacts
(shell-command "rm ~/.emacs.d/config/*.el")
(shell-command "rm ~/.emacs.d/config/lang/*.el")

;; tell emacs to use customize.el for customization
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file)

;; start emacs server from this instance for emacsclient
(server-start)
;; open the config directory at startup
(oo-open-config)
;;; init.el ends here
