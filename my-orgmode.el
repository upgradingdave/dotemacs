;; Org Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; (setq org-agenda-files (list "~/notes" ))
(setq org-agenda-files (list "~/notes/gtd.org"))
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "DONE")))
(setq org-tag-alist '(("repeating" . ?r) ("ahrq" . ?a) ("house" . ?h) ("softwaredev" . ?s) ("family" . ?f) ("money" . ?m) ("function1" . ?1) ("blog" . ?b) ("errands" . ?e) ("uncategorized" . ?u) ("someday" . ?d) ("lazyjake" . ?l)))

;; Remember
(add-to-list 'load-path "~/.emacs.d/thirdparty/remember-latest")
;;(org-remember-insinuate)
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/gtd.org"))
;;(setq org-remember-default-headline "Next Actions")
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(("Simple" ?s "* %? :%^{Category|uncategorized|family|function1|errands|house|friends|money|softwaredev|blog|ahrq|someday|lazyjake}:\n  %i\n" nil "Actions")))

;; Archive
(setq org-archive-location (expand-file-name (concat org-directory "/gtd.org::* Archive")))
