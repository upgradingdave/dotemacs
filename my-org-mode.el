;; Org Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'org-remember)

(setq org-agenda-files (list "~/notes/gtd.org"))
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "DONE")))
(setq org-tag-alist '(("blog" . ?b) ("daily" . ?d) ("errands" . ?e) ("family" . ?f) ("house" . ?h) ("ideas" . ?i) ("money" . ?n) ("monthly" . ?m)  ("repeating" . ?r) ("softwaredev" . ?s) ("someday" . ?o) ("uncategorized" . ?u) ("weekly" . ?w) ("yearly" . ?y)))

;; org-remember
;; TODO need to revisit
;; (setq org-remember-default-headline "Next Actions")
;; (setq org-remember-templates
;;       '(("Simple" ?s "* %? :%^{Category|uncategorized|family|function1|errands|house|friends|money|softwaredev|blog|someday}:\n  %i\n" nil "Actions")))

;; Archive
(setq org-archive-location 
      (expand-file-name "~/notes/gtd.org::* Archive"))

;;(load "~/code/emacs/org-drill/org-drill.el")
;;(require 'cl-lib)
;;(require 'org-drill)



