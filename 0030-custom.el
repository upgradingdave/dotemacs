(defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key (kbd "M-i") 'ido-goto-symbol)

;;  after-change-major-mode-hook
(defun dp/minor-mode-setup (file-extension minor-mode-fn)
  "Use this along with `after-change-major-mode-hook to set minor
mode MINOR-MODE-FN to start whenever a file with FILE-EXTENSION
is opened."
  (let* ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (if (equal file-ext file-extension)
        (funcall minor-mode-fn))))

;; Useful functions
(defun dp/fix-line-ending ()
  (interactive)
  (query-replace "
" ""))

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

;; A few functions thanks to emacsrocks.com 
;; https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el#L144-166
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))
