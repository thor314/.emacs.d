(add-hook 'text-mode-hook (lambda ()
														(turn-on-auto-fill)
														(setq sentence-end-double-space nil) ; single space after periods
														(setq line-number-mode nil)
														(setq-default fill-column 115)
														))

(setq org-agenda-files '("~/org" ))
(setq org-agenda-custom-commands ; options - todo, tags, tags-todo
			'(("d" "Dev" tags-todo "DEV")
				("e" "Emacs" tags-todo "EMACS")
				("p" "Personal" tags-todo "PERS")
				("r" "Research" tags-todo "RSCH")
				("m" "Research" tags-todo "MAIN")
				))
(setq org-agenda-start-on-weekday nil) ; start today

(setq org-tag-alist '(("dev" . d) ("personal" . ?p) ("research" . ?r) ("main" . ?m)))

(setq org-default-notes-file (concat org-directory "~/org/tktodos.org")) ; capture
	(setq org-capture-templates
				 '(
		 ("z" "Misc todo" entry (file+headline "~/org/misc.org" "Misc")
			"* TODO \t %? :MISC:\nAdded: %u:" :empty-lines 1 )
		 ("d" "Dev" entry (file+headline "~/org/dev.org" "Dev")
			"* TODO \t %? :DEV:\nAdded: %u" :empty-lines 1 )
		 ("M" "Main Dev" entry (file+headline "~/org/main.org" "Main")
			"* TODO [#A] \t %? :MAIN:DEV:\nAdded: %u" :empty-lines 1 )
		 ("R" "Main Rsch" entry (file+headline "~/org/main.org" "Main")
			"* TODO [#A] \t %? :MAIN:RSCH:\nAdded: %u" :empty-lines 1 )
		 ("e" "Emacs" entry (file+headline "~/org/emacs.org" "Emacs")
			"* TODO \t %? :EMACS:\nAdded: %u" :empty-lines 1 )
		 ("p" "Personal" entry (file+headline "~/org/pers.org" "Pers")
			"* TODO \t %? :PERS:\nAdded: %u" :empty-lines 1 )
		 ("r" "Research" entry (file+headline "~/org/rsch.org" "Rsch")
			"* TODO \t %? :RSCH:\nAdded: %u" :empty-lines 1 )
		 ("i" "Idea" entry (file "~/org/ideas.org")
			"* \t %? :IDEA:\nAdded: %u" )
))

(use-package org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(global-set-key (kbd "C-c l") 'org-store-link) ; a link to dir in org file
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(add-hook 'org-mode-hook
					(lambda ()
						(local-set-key (kbd "C-; e") 'tk-org-insert-lisp-block)
						(local-set-key (kbd "C-; r") 'tk-org-insert-rust-block)
						(local-set-key (kbd "C-c d") 'insert-date)
						))

(add-hook 'org-mode-hook (lambda ()
													 (setq org-src-fontify-natively t) ; font-lock src if org recognizes the code block
													 (setq org-src-tab-acts-natively t)
													 (setq org-adapt-indentation nil) ; turn off special indentation in org subsections
													 (setq org-directory "~/org")
													 (setq org-log-done 'time) ; timstamp when TODO - DONE
													 ))
