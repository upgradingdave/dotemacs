;; yasnippet
(require 'yasnippet)
(yas/initialize)
;; Change prompt from the default: 
;; (yas/x-prompt yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)
(setq yas/prompt-functions '(yas/completing-prompt yas/ido-prompt yas/no-prompt))
(setq yas/root-directory 
      '("~/.emacs.d/dparoulek/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; functions used in yasnippets

(defun yas/completing-file (&optional dir regex)
  "This function can be used inside snippets to allow auto
completion of file names inside minibuffer during snippet
expansion"
  (let* ((dir (expand-file-name (or dir ".")))
         (result (ido-read-file-name "file: " dir "" nil "" regex)))
    result))



