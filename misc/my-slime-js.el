;; Based on http://emacsrocks.com/e11.html
;; and https://github.com/magnars/.emacs.d/blob/master/setup-slime-js.el
;;
;; First, we need slime installed. Get latest copy from here: 
;;http://common-lisp.net/project/slime/doc/html/Downloading.html#Downloading
(add-to-list 'load-path "~/code/elisp/slime-2013-04-05")  ; your SLIME directory
(require 'slime)
(slime-setup)

;; Next, we need swank-js (this provides communication between slime
;; and javascript) 
;;
;; Next, install swank-js globally like so: 
;; npm -g install swank-js
;; swank-js command should be available
;;
;; Remember to put slime-js.el into the SLIME/contrib directory
;;
;;
;; Note, the web page you want to interact with, needs to include:
;; <script src="../swank-js/swank-js.js"></script>
;;
;; (for some reason) if I start swank-js only from emacs it
;; doesn't work, so create a node project with this package.json: 
;; { 
;;      "devDependencies": {
;;      "swank-js": ">=0.0.1"
;;     },
;;       "scripts": {
;;       "swank": "node node_modules/swank-js"
;;     }
;;   }
;; And then start swank-js like this: 
;; npm run swank
;;
;; Then, simply use "slime-js-jack-in-browser", which should 1) start
;; swank-js process, and 2) open http://localhost:8009 in browser. 
;; Then, you can see swank-js output inside terminal

(require 'slime-js)

(setq slime-js-target-url "http://localhost:8181")
(setq slime-js-connect-url "http://localhost:8009")
(setq slime-js-starting-url "/")
(setq slime-js-swank-command "swank-js")
(setq slime-js-swank-args '())
(setq slime-js-browser-command "open -a \"Google Chrome\"")
(setq slime-js-browser-jacked-in-p nil)

(add-hook 'js2-mode-hook (lambda () (slime-js-minor-mode 1)))

(defun slime-js-run-swank ()
  "Runs the swank side of the equation."
  (interactive)
  (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

(defun slime-js-jack-in-node ()
  "Start a swank-js server and connect to it, opening a repl."
  (interactive)
  (slime-js-run-swank)
  (sleep-for 1)
  (setq slime-protocol-version 'ignore)
  (slime-connect "localhost" 4005))

(defun slime-js-jack-in-browser ()
  "Start a swank-js server, connect to it, open a repl, open a browser, connect to that."
  (interactive)
  (slime-js-jack-in-node)
  (sleep-for 2)
  (slime-js-set-target-url slime-js-target-url)
  (shell-command (concat slime-js-browser-command " " slime-js-connect-url slime-js-starting-url))
  (sleep-for 3)
  (setq slime-remote-history nil)
  (slime-js-sticky-select-remote (caadr (slime-eval '(js:list-remotes))))
  (setq slime-js-browser-jacked-in-p t)
  (global-set-key (kbd "M-n") 'slime-js-reload))
  ;; (global-set-key [f5] 'slime-js-reload))

(defadvice save-buffer (after save-css-buffer activate)
  (when (and slime-js-browser-jacked-in-p (eq major-mode 'css-mode))
    (slime-js-refresh-css)))

(defadvice save-buffer (after save-html-buffer disable)
  (when (and slime-js-browser-jacked-in-p (eq major-mode 'sgml-mode))
    (slime-js-reload)))

(defun js2-eval-friendly-node-p (n)
  (or (and (js2-stmt-node-p n) (not (js2-block-node-p n)))
      (and (js2-function-node-p n) (js2-function-node-name n))))

(defun slime-js--echo-result (result &rest _)
  (message result))

(defun slime-js--replace-with-result (replacement beg end)
  (save-excursion
    (goto-char beg)
    (delete-char (- end beg))
    (insert replacement)))

(defun slime-js-eval-region (beg end &optional func)
  (lexical-let ((func (or func 'slime-js--echo-result))
                (beg beg)
                (end end))
    (slime-flash-region beg end)
    (slime-js-eval
     (buffer-substring-no-properties beg end)
     #'(lambda (s) (funcall func (cadr s) beg end)))))

(defun slime-js-eval-statement (&optional func)
  (let ((node (js2r--closest 'js2-eval-friendly-node-p)))
    (slime-js-eval-region (js2-node-abs-pos node)
                          (js2-node-abs-end node)
                          func)))

(defun slime-js-eval-current ()
  (interactive)
  (if (use-region-p)
      (slime-js-eval-region (point) (mark))
    (slime-js-eval-statement)))

(defun slime-js-eval-and-replace-current ()
  (interactive)
  (if (use-region-p)
      (slime-js-eval-region (point) (mark) 'slime-js--replace-with-result)
    (slime-js-eval-statement 'slime-js--replace-with-result)))

(define-key slime-js-minor-mode-map (kbd "C-x C-e") 'slime-js-eval-current)
(define-key slime-js-minor-mode-map (kbd "C-c C-e") 'slime-js-eval-and-replace-current)

;; Remove slime-minor-mode from mode line if diminish.el is installed
(when (boundp 'diminish)
  (diminish 'slime-js-minor-mode))

(provide 'my-slime-js)
