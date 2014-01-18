(setq-default js2-basic-offset 2)
(setq-default js2-bounce-indent-p t)

;; js2-mode steals TAB, let's steal it back for yasnippet
;; (borrowed from https://github.com/magnars/.emacs.d/blob/master/setup-js2-mode.el)
(defun js2-tab-properly ()
  (interactive)
  (let ((yas/fallback-behavior 'return-nil))
    (unless (yas/expand)
      (indent-for-tab-command)
      (if (looking-back "^\s*")
          (back-to-indentation)))))

(define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

