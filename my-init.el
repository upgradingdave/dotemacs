;;; Ensure the following snippet is added to `.emacs.d/init.el`
;;; But, don't uncomment it here!
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

;;; Load favorite packages from elpa
(defvar my-packages '(starter-kit js2-mode magit php-mode slime-js js-comint ace-jump-mode
                                  unbound markdown-mode feature-mode yasnippet 
                                  clojure-mode clojure-test-mode nrepl gist 
                                  command-frequency rainbow-delimiters twittering-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; yasnippet
(require 'yasnippet)
(yas/initialize)
;; Change prompt from the default: 
;; (yas/x-prompt yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)
(setq yas/prompt-functions '(yas/completing-prompt yas/ido-prompt yas/no-prompt))
(setq yas/root-directory 
      '("~/.emacs.d/dparoulek/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(load "~/code/elisp/ORGMODE-Markdown/org-export-generic.el")
(load "~/code/elisp/ORGMODE-Markdown/markdown.el")

;; ecukes
;;(add-to-list 'load-path "~/code/elisp/ecukes")
;;(require 'ecukes)

;; maven
(add-to-list 'load-path "~/code/elisp/maven-mode")
(require 'mvn-mode)

(require 'unbound)

;; command-frequency
;;(require 'command-frequency)
;;(command-frequency-table-load)
;;(command-frequency-mode 1)
;;(command-frequency-autosave-mode 1)

;;erc 
(setq erc-hide-list (quote ("JOIN" "QUIT")))

;;twittering-mode
(require 'twittering-mode)

;; nxhtml
(load "~/.emacs.d/vendor/nxhtml/autostart.el")

(add-to-list 'load-path "~/.emacs.d/site-lisp/cookbook")

(dired default-directory)
