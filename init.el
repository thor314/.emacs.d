;;; emacs.d/init.el --- Thor Kamphefner's emacs config orchestrator
;;; Commentary:
;; I opt for a literate set-up, modularized into several files.
;; Modularity to more quickly get in and out of the right spot.
;; Literate to document the config unobtrusively.

;;; Code:

;; Get package repositories
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Update package archives and get use-package
;; https://github.com/jwiegley/use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents) ; download package-archive descriptions
  (package-install 'use-package)) ; to be used in place of package

;; Install packages automatically if not already present
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Autocompile source files on save, use latest version available
;; https://github.com/emacscollective/auto-compile
(use-package auto-compile
	;; reduce risk of loading outdated bytecode
	:config (setq load-prefer-newer t)
	(auto-compile-on-save-mode)
	(auto-compile-on-load-mode))


(org-babel-load-file "~/.emacs.e/config/general.org")
(org-babel-load-file "~/.emacs.e/config/tk_functions.org")
(org-babel-load-file "~/.emacs.e/config/programming.org")
(org-babel-load-file "~/.emacs.e/config/text.org")
(org-babel-load-file "~/.emacs.e/config/experimental.org")

;; tell emacs to use customize.el for customization
(setq custom-file "~/.emacs.e/config/customize.el")
(load custom-file)

;;; init.el ends here
