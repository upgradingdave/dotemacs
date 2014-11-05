;; yasnippet
(require 'yasnippet)

(setq yas/root-directory '("~/.emacs.d/dparoulek/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

;; functions used in yasnippets

(defun yas/completing-file (&optional dir regex)
  "This function can be used inside snippets to allow auto
completion of file names inside minibuffer during snippet
expansion"
  (let* ((dir (expand-file-name (or dir ".")))
         (result (ido-read-file-name "file: " dir "" nil "" regex)))
    result))



