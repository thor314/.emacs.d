;;; emacs.d/init.el --- Thor Kamphefner's emacs config orchestrator
;;; Commentary:
;; I tried out a literate set-up. It wasn't possible to configure Org files
;; to feel good to write code in, eg with org-poly-mode, so I migrated back.
;;
;; I've kept some of my text-mode configurations in org files, because why
;; not. But any complex code should go in a .el file. Misc packages is
;; still in an org file, as they consist of more text than code, and the
;; folding is nice. I use ripgrep to find whatever section I want.

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

;; core of useful stuff
(load-file "./config/01_tk_functions.el")
(load-file "./config/02_general.el")
(load-file "./config/03_appearance.el")
(load-file "./config/04_eshell.el")
(load-file "./config/05_dired.el")
(load-file "./config/06_secret.el") ;; doesn't get vc'd
(load-file "./config/07_auth_tramp_path.el")

;; nice packages
(load-file "./config/11_ivy.el")
(load-file "./config/12_smartparens.el")
(org-babel-load-file "./config/13_misc_packages.org")
(load-file "./config/14_messaging.el")

;; programming
(load-file "./config/21_programming.el")
(load-file "./config/20_lang/1_elisp.el")
(load-file "./config/20_lang/2_sh.el")
(load-file "./config/20_lang/3_rust.el")
(load-file "./config/20_lang/4_python.el")

;; configure text files
(load-file "./config/31_text.el")
(load-file "./config/32_org_agenda.el")
(load-file "./config/33_org_roam.el")
(load-file "./config/34_org_templates.el")
(load-file "./config/341_org_roam_templates.el")
(load-file "./config/35_latex.el")
(load-file "./config/39_org_config.el")

;; load last
(load-file "./config/81_global_keybinds.el")
;;(load-file "~/.emacs.d/config/91_experimental.el")

;; tell emacs to use customize.el for customization
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file)

;; start emacs server from this instance for emacsclient
;; then, can start new instances with `emacsclient -c`
;(server-start)

;(split-window-right)
(org-journal-new-entry 1)
(org-agenda "a" "a")
(other-window 1)
;;; init.el ends here
