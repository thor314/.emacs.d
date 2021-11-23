;;; emacs.d/init_debugger.el
;;; Commentary:
;;; copy paste .el files in here, then M-x bug-hunter-file to trace.
;;; Code:

;; Get package repositories
(require 'package)
;;(require 'cl-lib) ; not currently needed
;; NB! If a package cannot be found, try Mx package-refresh-contents!
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
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
;;; init.el ends here
