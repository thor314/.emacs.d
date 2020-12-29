(use-package ivy) ; intentional redundancy; counsel installs ivy.
(setq ivy-use-virtual-buffers t ; add recents+bkmks to ivy-switch-buffer
			ivy-count-format "%d/%d ")
(setq ivy-display-style 'fancy) ; regex-enabled
(ivy-mode 1)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-c z") 'ivy-switch-view)
(global-set-key (kbd "C-c r") 'ivy-resume)

(use-package ivy-rich)
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line) ; formatting
(setq ivy-rich-path-style 'abbrev) ; abbreviate paths with ~/

(use-package swiper) ; better isearch
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-r") 'swiper-isearch-backward)

(use-package counsel)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-c b") 'counsel-bookmark) ; note: bkmks overlap with ivy-view
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "<menu>") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop) ; nicer kill ring
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c l") 'counsel-locate)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)
(global-set-key (kbd "C-c L") 'counsel-git-log) ; seldom used

(use-package counsel-projectile)
(global-set-key (kbd "C-c p SPC") 'counsel-projectile)
(global-set-key (kbd "C-c p d") 'counsel-projectile-find-dir)

(use-package avy)
(global-set-key (kbd "M-p") 'avy-goto-char)
