(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; add themes folder to theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'wombat t)

;; desired starter-kit packages
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-js starter-kit-bindings
                                  clojure-mode clojure-test-mode
                                  projectile rainbow-delimiters rainbow-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(projectile-global-mode)
(global-rainbow-delimiters-mode)
(setq projectile-globally-ignored-files '("TAGS" "*.js"))

;; (eshell)

;; clojure-mode
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(setq clojure-mode-inf-lisp-command "lein trampoline cljsbuild repl-listen")

;; cosmetics
;; lose the stupid pipe chars on the split-screen bar
(set-face-foreground 'vertical-border "white")
(set-face-background 'vertical-border "white")

;; font size
(set-face-attribute 'default nil :height 120)
(set-default-font "Monaco-11")

;; markdown
;; add file extentions to mode auto load
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; other options
;; set ispell program name to aspell (brew install aspell)
(setq-default ispell-program-name "aspell")

;; turn off annoying visual-bell
(setq visible-bell nil)

;; save backup files to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))

;; projectile
(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories ".lein*")
     (add-to-list 'grep-find-ignored-directories "resources")
     (add-to-list 'grep-find-ignored-directories "migrations")
     (add-to-list 'grep-find-ignored-directories "target")
     (add-to-list 'grep-find-ignored-directories "out")))

;; Teach compile the syntax of the kibit output
(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
         '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
(add-to-list 'compilation-error-regexp-alist 'kibit)

;; A convenient command to run "lein kibit" in the project to which
;; the current emacs buffer belongs to.
(defun kibit ()
  "Run kibit on the current project.
Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile "lein kibit"))

(defun kibit-current-file ()
  "Run kibit on the current file.
Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile (concat "lein kibit " buffer-file-name)))

(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "6938c51c0a89f078c61b979af23ae4c32204458f16a6a08c1a683ab478a7bc6b" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;(load "~/.emacs.d/floobits/floobits.el")

