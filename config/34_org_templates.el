;; [[https://orgmode.org/manual/Capture-templates.html][Capture templates
;; (The Org Manual)]] This can be one of the most useful functions in all
;; of Emacs, automating a lot of boilerplate text.
(setq org-default-notes-file (concat org-directory "/notes.org")) ; capture
(setq org-capture-templates
  '(
     ;; the following two sections might be better served by some
     ;; integration with projectile, but I couldn't find a feature
     ;; implementation, so the following creates an entry in the project
     ;; root directory for creating notes or todos.

     ;; Use this format to create todos in major projects
     ("t" "Notes files in various directories")
     ("te" "Emacs todo" entry (file+headline "~/.emacs.d/todo.org" "Todos")
       "** TODO %u: %? \n" :prepend t)
     ("to" "Org todo" entry (file+headline "~/org/todo.org" "Todos")
       "*** TODO %u: %? \n" :prepend t)

     ;; Use this format to create quicknotes in projects
     ("n" "Notes files in various directories")
     ("ne" "Emacs usage note" entry (file+headline "~/.emacs.d/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)
     ("no" "Org usage note" entry (file+headline "~/org/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)
     ("na" "Advent of Code note" entry (file+headline "~/py/play/advent/notes.org" "Notes")
       "* Note from %u: %? :NOTE:\n" :prepend t)

     ;; Store todos in file agenda/todo.org
     ("c" "Crypto" entry (file+headline "~/org/agenda/todo.org" "Crypto")
       "* TODO \t %? :CRYPTO:\nAdded: %u" :prepend t)
     ("e" "Emacs" entry (file+headline "~/org/agenda/todo.org" "Emacs")
       "* TODO \t %? :EMACS:\nAdded: %u" :prepend t)
     ("l" "Linux" entry (file+headline "~/org/agenda/todo.org" "Linux")
       "* TODO \t %? :LINUX:\nAdded: %u" :prepend t)
     ("m" "Math" entry (file+headline "~/org/agenda/todo.org" "Math")
       "* TODO \t %? :MATH:\nAdded: %u" :prepend t)
     ("p" "Personal" entry (file+headline "~/org/agenda/todo.org" "Pers")
       "* TODO \t %? :PERS:\nAdded: %u" :prepend t)
     ("r" "Rust" entry (file+headline "~/org/agenda/todo.org" "Rust")
       "* TODO \t %? :RUST:\nAdded: %u" :prepend t)
     ("w" "Write" entry (file+headline "~/org/agenda/todo.org" "Write")
       "* TODO [#B] \t %? :WRITE:\nAdded: %u" )
     ("z" "Misc todo" entry (file+headline "~/org/agenda/todo.org" "Misc")
       "* TODO \t %? :MISC:\nAdded: %u" :prepend t )
     ;; Declare new habits
     ;; issue: can't figure out how to include the ++1x inside the scheduled timestamp
     ("h" "Habits of various intervals")
     ("hw" "Weekly Habit" entry (file+headline "~/org/agenda/habits.org" "Weekly Habits")
       "* TODO \t %? :HABIT:WEEKLY:\nSCHEDULED: %^t ++1w \n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hm" "Monthly Habit" entry (file+headline "~/org/agenda/habits.org" "Monthly Habits")
       "* TODO \t %? :HABIT:MONTHLY:\nSCHEDULED: %^t ++1m\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hq" "Quarterly Habit" entry (file+headline "~/org/agenda/habits.org" "Quarterly Habits")
       "* TODO \t %? :HABIT:QUARTERLY:\nSCHEDULED: %^t ++3m\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ("hy" "Yearly Habit" entry (file+headline "~/org/agenda/habits.org" "Yearly Habits")
       "* TODO \t %? :HABIT:YEARLY:\nSCHEDULED: %^t ++1y\n:PROPERTIES:\n:STYLE: habit\n:END:\nAdded: %u" :prepend t)
     ;; Misc templates
     ("P" "Project idea" entry (file+headline "~/org/agenda/ideas.org" "Projects")
       "* \t %? :IDEA:PROJECT:\nAdded: %u\n" :prepend t)
     ("I" "Idea" entry (file+headline "~/org/agenda/ideas.org" "Ideas")
       "* \t %? :IDEA:\nAdded: %u\n" :prepend t)
     ("W" "Want list" entry (file+headline "~/org/agenda/ideas.org" "Wants")
       "* \t %? :WANT:\nAdded: %u\n" :prepend t)
     ))

;; Notes on org capture template. See
;; [[https://www.gnu.org/software/emacs/manual/html_node/org/Template-elements.html#Template-elements][this]]
;; for option elements, and
;; [[https://www.gnu.org/software/emacs/manual/html_node/org/Template-expansion.html#Template-expansion][this]]
;; for template escape sequences. Usage:
;;
;; - (key description type target template properties)
;; - types: entry (org node), item (plain list item at location), checkitem (checkbox item),
;; table-line, plain templates:
;; [[https://orgmode.org/manual/Template-expansion.html#Template-expansion][many]]
;; targets: file "file", id "existing id", file+headline "file" "node",
;; datetree, clock properties: prepend, empty-lines, clock-in/keep/resume,
;; time-prompt, tree-type, table-line-pos
;;
;; %? = point;
;; %i = initial content
;; %a = location stored from ; %l = literal
;; %x,c = put pastebin, killring head
;; %k title of currently clocked task; K = link to
;; : %^g prompt for tags; G completion all tags all agenda files
;; : %^t prompt date, T,u,U
;; : %^{PROPMT|default|completion2|...} pick from a sequence of prompts
;; %t = datestamp; T= time+datestamp; u,U = inactive timestamps - don't cause item
;;  to show up in agenda
