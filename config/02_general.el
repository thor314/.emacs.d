;; Global Settings
;; Be less annoying and more nice
(defalias 'yes-or-no-p 'y-or-n-p) ; brevity is the soul of wit
(setq inhibit-startup-message t
  ;; When upgrading emacs to 28, uncomment
  ;; Silence compiler warnings as they can be pretty disruptive
  ;; comp-async-report-warnings-errors nil
  gc-cons-threshold 20000000 ; default is 800KB, set to 200MB
  read-process-output-max 3000000 ;; incr data read from process. default is 4kb.
  require-final-newline t ; Whether to add a newline automatically at the end of the file.
  next-line-add-newlines t ; add newline on C-n at EOF
  vc-follow-symlinks 't ; What to do if visiting a symbolic link to a file under version control.
  ring-bell-function 'ignore)
;; reminder: setq-default: affects global default; setq: sets local value;  all buffers;
(setq-default indent-tabs-mode nil ; prefer spaces not tabs
  fill-column 75
  dired-listing-switches "-alh" ; add human-readable units
  tab-width 2
  c-basic-offset 2) ; programming modes often use this
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Put backups~ and #autosaves# in /tmp
;; also look at https://github.com/emacscollective/no-littering/blob/master/no-littering.el
;; why not used: meh
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory))
  auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

;; Turn theses modes off
(auto-composition-mode 0) ; turn off (small diff): text characters automatically composed by functions registered in composition-function-table
(blink-cursor-mode 0) ; annoying blinking cursor
(file-name-shadow-mode 0) ; dims unused parts of files in minibuffer
(line-number-mode 0) ; clutter mode line
(tool-bar-mode 0)
(set-fringe-mode 0) ;; smaller fringe
(menu-bar-mode 0)
(column-number-mode 0)
(electric-pair-mode 0) ;; prefer smartparens (more complex tho)
(scroll-bar-mode 0)
(set-window-scroll-bars (minibuffer-window) nil nil) ; why scroll bar in minibuffer
(setq visible-bell 0)

;; Emacs played in minor key
;; N2R: Some of these are on by default; explicitness seems good.
(auto-compression-mode 1) ; auto-handle (un)?zip on visit zipped file
(auto-encryption-mode 1) ; automatic file (en|de)cryption
(delete-selection-mode 1) ; delete region on entry
(electric-indent-mode 1) ; auto-indent on enter
(global-auto-revert-mode 1) ; revert buffers when file changes on disk; convenient.
(setq global-auto-revert-non-file-buffers t
  auto-revert-verbose nil)
(global-display-line-numbers-mode) ; not to be confused with line-number-mode
(global-font-lock-mode 1) ; decorate text
(global-hl-line-mode 1) ; highlight current line
(global-visual-line-mode) ; wrap long lines
(mouse-wheel-mode 1) ; allow scroll by mouse-wheel
(transient-mark-mode) ; don't hide active selected region
(winner-mode)
(global-set-key (kbd "C-x w f") 'winner-redo)
(global-set-key (kbd "C-x w b") 'winner-undo)

;; Set frame transparency, maximize screen by default
(defvar tk/frame-transparency '(95 . 95))
(set-frame-parameter nil 'alpha tk/frame-transparency)
(set-frame-parameter nil 'fullscreen 'maximized)
;; put in default frame settings
(add-to-list 'default-frame-alist `(alpha . ,tk/frame-transparency))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Unset keys
;; Explicitly unset some keys that aren't very useful, reserving them for future personal use patterns.
;; Use this for apps: eshell, dired, spotify, signal, telegram, twitter, stack exchange, etc.
(global-unset-key (kbd "C-r"))
;; tbd what I'll do with these
(global-unset-key (kbd "C-o"))
(global-unset-key (kbd "C-;")) ; decorate text, sp-wrap
(global-unset-key (kbd "C-j"))
(global-unset-key (kbd "M-r"))
(global-unset-key (kbd "M-'")) ; avy jump
(global-unset-key (kbd "M-i"))
(global-unset-key (kbd "M-o"))
(global-unset-key (kbd "M-p"))
(global-unset-key (kbd "M-r"))
                                        ;(global-unset-key (kbd "C-l")) ;;
                                        ;(global-unset-key (kbd "M-j")) ;; actually useful
;; back already? consider unsetting M-c,M-l,M-u,M-h,M-q.
