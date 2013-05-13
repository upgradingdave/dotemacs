;;; Ensure the following snippet is added to `.emacs.d/init.el`
;;; But, don't uncomment it here!
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (when (not package-archive-contents)
;;   (package-refresh-contents))

;;; Load favorite packages from elpa
(defvar my-packages '(starter-kit js2-mode magit php-mode slime-js js-comint ace-jump-mode
                                  unbound markdown-mode feature-mode yasnippet 
                                  clojure-mode clojure-test-mode nrepl gist 
                                  command-frequency rainbow-delimiters twittering-mode 
                                  scala-mode2 color-theme color-theme-solarized)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;  after-change-major-mode-hook
(defun dp/minor-mode-setup (file-extension minor-mode-fn)
  "Use this along with `after-change-major-mode-hook to set minor
mode MINOR-MODE-FN to start whenever a file with FILE-EXTENSION
is opened."
  (let* ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (if (equal file-ext file-extension)
        (funcall minor-mode-fn))))

;; Useful functions
(defun dp/fix-lin-ending ()
  (interactive)
  (query-replace "" ""))

(defun dp/indent-with-tabs-only ()
  "I used this to work on xml files that used tabs for
indentation without any space padding. The key is to set
tab-width equal to the same number of columns that the current
mode wants to use to do auto indent. Also, after this, you need
to delete leading whitespace, then do auto-indent (or tabify
might work too)"
  (interactive)
  ;; (setq indent-line-function (quote insert-tab))
  (setq indent-tabs-mode t)
  (setq tab-width 2))


(defun dp/indent-with-4-spaces ()
  (interactive)
  ;; (setq indent-line-function (quote insert-tab))
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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
;;(load "~/.emacs.d/vendor/nxhtml/autostart.el")

(dired default-directory)

