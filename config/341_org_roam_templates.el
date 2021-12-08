;; roam-capture templates [[https://www.orgroam.com/manual.html#Template-Walkthrough][docs]]
(setq org-roam-capture-templates
  (setq org-roam-capture-templates
    '(
       ("c" "concept" plain "%?" ;; random thoughts, not used much
         :if-new (file+head "concept/%<%Y-%m-%d>-${slug}.org"
                   "#+title: ${title}\n#+filetags: :concept:\n* ")   :unnarrowed t)
       ("a" "article" plain "%?" ;; articles from the internet
         :if-new (file+head "lit/article/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :ROAM_REFS: %^{reference}
  :END:
  ,#+filetags: :article:\n#+title: ${title}\n* ")
         :unnarrowed t)
       ("b" "book review" plain "%?"
         :if-new (file+head "book/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :END:
  ,#+filetags: :book:\n#+title: ${slug}\n")
         :unnarrowed t)
       ("P" "Project" plain "%?"
         :if-new (file+head "project/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :END:
  ,#+filetags: :project:\n#+title: ${slug}\n* Setup\n** Expected duration\n** OKRs \n* Milestone 1 review\n* Postmortem \n** Discussion \n** Links\n** Time taken: \n** Next project: ")
         :unnarrowed t)
       ("p" "paper" plain "%?" ;; papers
         :if-new (file+head "lit/paper/%<%Y-%m-%d>-${slug}.org"
                   ":PROPERTIES:
  :ROAM_REFS: %^{reference}
  :END:
  ,#+filetags: :paper:\n#+title: ${title}\n* ")
         :unnarrowed t)
       ("w" "week review" plain "%?"
         :if-new (file+head "review/week/%<%Y-%m-%d>-week_review.org"
                   "#+title: Week Review %<%Y-%m-%d> \n#+filetags: :week_review:\n* Week In Review\n** Big vibes\n** Concepts\n** Free Write\n** Projects in Review\n** Projects for this Week\n** Theme for Week:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n")
         :unnarrowed t)
       ("m" "month review" plain "%?"
         :if-new (file+head "review/month/%<%Y-%m-%d>-month_review.org"
                   "#+title: Month Review %<%Y-%m-%d> \n#+filetags: :month_review:\n* Month In Review\n** Big vibes\n** Concepts\n** Free Write\n** Theme for Month:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Value Review:\n*** Self-love\n*** Placing curiosity above judgement\n*** Creating community\n*** Learning and building\n** Review of Crypto Finances\n")
         :unnarrowed t)
       ("q" "quarter review" plain "%?"
         :if-new (file+head "review/quarter/%<%Y-%m-%d>-quarter_review.org"
                   "#+title: Quarter Review %<%Y-%m-%d> \n#+filetags: :quarter_review:\n* Quarter In Review\n** Big vibes\n** Free Write\n** Theme for Quarter:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n\nPeople https://docs.google.com/spreadsheets/d/17u74o6Z5y6o8YGpMzJ4YLM3dF01WkwoUYblAS8wHqoM/edit?usp=drive_web&ouid=115883971599314555687 ")
         :unnarrowed t)
       ("y" "year review" plain "%?"
         :if-new (file+head "review/year/%<%Y-%m-%d>-year_review.org"
                   "#+title: Year Review %<%Y-%m-%d> \n#+filetags: :year_review:\n* Year In Review\n** Big vibes\n** Free Write\n** Theme for Year:\n** Review of Predictions \n** PPRESH check-in\n*** Professional - \n*** Projects - \n*** Romantic - \n*** Emotional - \n*** Social - \n*** Phys Health - \n*** Attn Health - \n** Review of Crypto Finances\n")
         :unnarrowed t)
       )))
