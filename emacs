;; This file is not part of GNU Emacs.

; Use a dark color schema


(require 'package)
(require 'uniquify)
(require 'whitespace)

; Require ido everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; Setup Package Repositories
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(package-initialize)

; Make sure all our packages are installed
(defvar jam-packages
  '(gist magit markdown-mode sass-mode scss-mode yaml-mode
        projectile yasnippet undo-tree csv-mode rainbow-mode nose
        pep8 pylint pyflakes pytest git-commit flymake flymake-easy
        flymake-python-pyflakes flymake-cursor rainbow-delimiters
        move-text jedi deferred ipython rst json css-mode
	auto-complete js2-mode virtualenv)
  "A list of packages to ensure are installed at launch.")

(dolist (p jam-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Handle non-unique buffers better
(setq uniquify-buffer-name-style 'post-forward)
(require 'undo-tree)
(global-undo-tree-mode 1)

; Setup Rainbow Delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

; Setup move-text package
(require 'move-text)
(move-text-default-bindings)


; Configure whitespace settings to display when we are over 80chars
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 79)
(global-whitespace-mode 1)
(setq-default fill-column 79)

; Load wombat colors
(load-theme 'wombat t)

; no startup msg
(setq inhibit-startup-message t)

; turn on paren match highlighting
(show-paren-mode 1)

; highlight entire bracket expression
(setq show-paren-style 'expression)

; display line numbers in margin
(global-linum-mode 1)

; display the column and line our cursor is on
(column-number-mode 1)

; stop creating those backup~ files
(setq make-backup-files nil)

; stop creating those #autosave# files
(setq auto-save-default nil)

; highlight the current line we are editing
(global-hl-line-mode 1)

; disable the toolbar
(tool-bar-mode -1)

; disable the menubar
(menu-bar-mode -1)

; Never insert tabs
(setq-default indent-tabs-mode nil)

; Setup the python checker
(eval-after-load 'flymake '(require 'flymake-cursor))
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")

; Allow creating lines above and below
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))


; Key Bindings

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-M-return>") 'open-line-above)

; Set Aquamacs meta key
(setq mac-command-modifier 'meta)

; Setup Autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start nil)
(global-set-key "\M-/" 'ac-start)
(setq ac-auto-start 2)
(define-key ac-complete-mode-map "\M-/" 'ac-stop)

;; javascript mode
(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; zip and tar derivatives
(add-to-list 'auto-mode-alist '("\\.bz\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.jar\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.war\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.deb\\'" . archive-mode))
(add-to-list 'auto-mode-alist '("\\.pybundle\\'" . archive-mode))

;; other extensions
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sls$" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yaml$" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yml$" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yml$" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.zcml$" . sgml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pt$" . html-mode) auto-mode-alist))

(fset 'break
      "import pdb;pdb.set_trace()\C-a\C-i")

(fset 'postmortem
      "import pdb, sys;pdb.post_mortem(sys.exc_info()[2])\C-a\C-i")

(fset 'review
      "#@@ DWM: ")

(add-hook 'python-mode-hook '(lambda () (require 'virtualenv)))
(add-hook 'python-mode-hook
                  '(lambda ()
                     (local-set-key [(meta ?p) (meta ?p)] 'break)
                     (local-set-key [(meta ?p) (meta ?m)] 'postmortem)
                     (local-set-key [(meta ?p) (meta ?r)] 'review)
))

(defvar gud-pdb-marker-regexp "^> \\([-a-zA-Z0-9_/.:\\ ()]*\\|<string>\\)(\\([0-9]+\\))\\([a-zA-Z0-9_]*\\|\\?\\)()\\(->[^\n]*\\)?\n")

(setq frame-background-mode 'dark)

(defun untabify-buffer ()
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "[ \t]+$" nil t)
        (delete-region (match-beginning 0) (match-end 0)))
      (goto-char (point-min))
      (if (search-forward "\t" nil t)
          (untabify (1- (point)) (point-max))))
    nil)

;; never insert tabs ... always spaces
(setq-default indent-tabs-mode nil)

; add more hooks hereno
(add-hook 'c-mode-hook
    '(lambda ()
(make-local-variable 'write-contents-hooks)
(add-hook 'write-contents-hooks 'untabify-buffer)))

;; Work around bug in flymake that causes Emacs to hang when you open a
;; docstring.
(delete '(" *\\(\\[javac\\]\\)? *\\(\\([a-zA-Z]:\\)?[^:(\t\n]+\\)\:\\([0-9]+\\)\:[ \t\n]*\\(.+\\)" 2 4 nil 5)
        flymake-err-line-patterns)

;; And the same for the emacs-snapshot in Hardy ... spot the difference.
(delete '(" *\\(\\[javac\\] *\\)?\\(\\([a-zA-Z]:\\)?[^:( \n]+\\):\\([0-9]+\\):[ \n]*\\(.+\\)" 2 4 nil 5)
        flymake-err-line-patterns)

(delete '(" *\\(\\[javac\\] *\\)?\\(\\([a-zA-Z]:\\)?[^:( \n]+\\):\\([0-9]+\\):[ \n]*\\(.+\\)" 2 4 nil 5)
        flymake-err-line-patterns)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; avoid hangs launching warning box
(setq flymake-gui-warnings-enabled nil)

;; shortcut for directory resync
(add-hook 'shell-mode-hook
  (lambda()
    (local-set-key (kbd "M-]") 'shell-resync-dirs))) 

(defun sort-imports ()
  (interactive)
  (save-excursion
    (let ((open-paren (save-excursion (progn (up-list -1) (point))))
          (close-paren (save-excursion (progn (up-list 1) (point))))
          (string-lessp-case-insensitive
           (lambda (a b) (string-lessp (downcase a) (downcase b))))
          sorted-imports)
      (goto-char (1+ open-paren))
      (skip-chars-forward " \n\t")
      (setq sorted-imports
            (sort
             (delete-dups
              (split-string (buffer-substring
                             (point)
                             (save-excursion (goto-char (1- close-paren))
                                             (skip-chars-backward " \n\t")
                                             (point)))
                            ", *\\(\n *\\)?"))
             string-lessp-case-insensitive))
      (delete-region open-paren close-paren)
      (goto-char open-paren)
      (insert "(\n")
      (insert (mapconcat
               (lambda (import) (concat " " import ",\n"))
               (remove "" sorted-imports) ""))
      (insert " )")
      )))
