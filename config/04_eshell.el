;; Eshell - convenient emacs lisp compatible shell; [[https://www.gnu.org/software/emacs/manual/html_mono/eshell.html][man]]
;; - install fish-like [[https://github.com/dieggsy/esh-autosuggest/][autosuggest]]
;; - [[https://github.com/akreisher/eshell-syntax-highlighting][eshell-syntax-highlighting: Syntax highlighting for Eshell]]
;; Known [[https://emacs.stackexchange.com/questions/69654/eshell-sudo-doesnt-remember-password-for-apt][issue]] - on entering eshell, and doing something like, =sudo apt help=, I have to enter passphrase twice: once for global, once for apt/sudo stuff. Then I only have to enter the passphrase once for further sudo stuff.
;; enable password caching for up to 10 minutes
;; https://emacs.stackexchange.com/questions/5608/how-to-let-eshell-remember-sudo-password-for-two-minutes
;;(eshell/alias "sudo" "eshell/sudo $*") ;; prompts for sudo:root@localhost
(require 'em-tramp)
(setq eshell-prefer-lisp-functions t)
(setq eshell-prefer-lisp-variables t)
(setq password-cache t)
(setq password-cache-expiry 600)
(setq eshell-destroy-buffer-when-process-dies t)
(setq eshell-visual-commands '("htop" "zsh"))
(local-set-key (kbd "M-p") 'eshell-previous-matching-input-from-input)
(local-set-key (kbd "M-n") 'eshell-next-matching-input-from-input)
(setq eshell-history-size 10000
  eshell-hist-ignoredups t
  eshell-highlight-prompt t
  eshell-buffer-maximum-lines 10000
  eshell-scroll-to-bottom-on-input t)

(use-package esh-autosuggest
  :config
  (add-hook 'eshell-mode-hook
    (lambda ()
      (esh-autosuggest-mode)
                                        ;(define-key eshell-mode-map (kbd "<tab>") 'esh-autosuggest-complete-word)
      )))

(use-package eshell-syntax-highlighting
  ;; Adds syntax highlighting to commands entered in eshell
  :config
  (eshell-syntax-highlighting-global-mode +1))

;; Eshell tips
;; [[https://masteringemacs.org/article/complete-guide-mastering-eshell][this]] link tldr's useful eshell stuff:
;; - how eshell interacts with the OS
;; - subshells
;; - elisp commands (try: Ch f eshell/*)
;; - aliases, eg: =alias ff 'find-file $1'=
;; - pseudo-devices: try overwriting =dev/clip= or =/dev/kill=.
;; - [[https://www.gnu.org/software/emacs/manual/html_mono/eshell.html][the]] manual
