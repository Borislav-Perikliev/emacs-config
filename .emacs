(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Server-Start T)
 '(column-number-mode 1)
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("2fc864727be2c09ae29e12ec7e3255a90f18c99f86eb6824567baacd9e770d25"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7"
     default))
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(global-auto-complete-mode nil)
 '(global-company-mode)
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(ido-everywhere t)
 '(ido-mode t nil (ido))
 '(ido-ubiquitous-mode t)
 '(marginalia-mode t)
 '(menu-bar-mode nil)
 '(org-agenda nil)
 '(org-beautify-theme-autoloads t)
 '(org-bullets-mode t t)
 '(org-mode t)
 '(package-selected-packages
   '(## ada-mode ag auto-complete-c-headers auto-complete-clang
        auto-org-md bash-completion bilibili cargo-mode clojure-mode
        cmake-mode company-c-headers competitive-programming-snippets
        d-mode d2-mode dockerfile-mode dotnet drag-stuff
        duplicate-thing elpy emms emms-player-mpv-jp-radios
        emms-player-spotify emms-soundcloud emms-state exwm exwm-edit
        exwm-firefox-core exwm-float flylisp glsl-mode gnu-elpa
        gnu-elpa-keyring-update go-mode graphviz-dot-mode
        gruber-darker-theme haskell-mode helm-bitbucket helm-lsp iedit
        jinja2-mode julia-mode kotlin-mode latex-extra lua-mode
        magit-ido marginalia mc-extras nginx-mode nim-mode nix-mode
        ob-ada-spark ob-janet ob-mongo ob-powershell ob-prolog ob-tmux
        ob-typescript org-beautify-theme org-bullets org-elisp-help
        org-elp org-emms org-page org-roam package+ php-mode
        purescript-mode qml-mode quelpa racket-mode rfc-mode rust-mode
        rustic scala-mode smex sml-mode toml-mode tree-sitter tuareg
        typescript-mode vertico yaml-mode))
 '(recentf-mode t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(semantic-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(vertico-mode t)
 '(which-key-mode t)
 '(yas-global-mode t))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;======================================================================================================
;; Ebisp
(add-to-list 'auto-mode-alist '("\\.ebi\\'" . lisp-mode))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight medium :height 98 :width normal :foundry "CTDB" :family "IosevkaTerm Nerd Font Mono"))))
 '(font-lock-type-face ((t (:foreground "#95a99f"))))
 '(whitespace-space ((t (:background "#181818" :foreground "RoyalBlue3")))))

(setq package-check-signature nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)



(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list "~/.emacs.d/site-lisp/magit/Documentation/")
  (add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp"))
(require 'magit)

(require 'whitespace)
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode t)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'tuareg-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'porth-mode-hook 'rc/set-up-whitespace-handling)
(setq whitespace-style '(face tabs spaces tab-mark space-mark));;(face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark))
(add-hook 'dired-mode-hook
	  (lambda () (setq-local whitespace-style nil)))

(setq-default indent-tabs-mode nil)  ; Use spaces instead of tabs
(setq-default tab-width 4)            ; Set the width of a tab to 4 spaces


(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-x M-x") 'execute-extended-command)

(global-set-key (kbd "M-[") 'enlarge-window-horizontally)
(global-set-key (kbd "M-]") 'shrink-window-horizontally)
(global-set-key (kbd "C-{") 'enlarge-window)
(global-set-key (kbd "C-}") 'shrink-window)

(require 'dash)

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (line-beginning-position))) ;; (point-at-bol) or (pos-bol)
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

;=======================================================================================================

;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)

;;(setq ac-disable-faces nil)

;;(defun my-common-ac-setup ()
;;  (add-to-list 'ac-sources 'ac-source-symbols)
;;  (add-to-list 'ac-sources 'ac-source-words-in-buffer)
;;  (add-to-list 'ac-sources 'ac-source-dictionary))
;;
;;(add-hook 'prog-mode-hook 'my-common-ac-setup)
;;
;;(defun my:ac-c-header-init()
;;  (require 'auto-complete-c-headers)
;;  (add-to-list 'ac-sources 'ac-source-c-headers)
;;  (add-to-list 'achead:include-directories "/usr/include/c++/15")
;;  (add-to-list 'achead:include-directories "/usr/include/x86_64-linux-gnu/c++/15")
;;  (add-to-list 'achead:include-directories "/usr/include/c++/15/backward")
;;  (add-to-list 'achead:include-directories "/usr/lib/gcc/x86_64-linux-gnu/15/include")
;;  (add-to-list 'achead:include-directories "/usr/local/include/")
;;  (add-to-list 'achead:include-directories "/usr/include/x86_64-linux-gnu")
;;  (add-to-list 'achead:include-directories "/usr/include/")
;;  (add-to-list 'achead:include-directories "/usr/"))
;;
;;
;;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
;;(add-hook 'c-mode-hook 'my:ac-c-header-init)

;=========================================================================================================

(require 'company)
(add-hook 'prog-mode-hook 'company-mode)
(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-selection-wrap-around t)
(require 'company-c-headers)

(defun my-company-c-setup ()
  (add-to-list 'company-backends 'company-c-headers))

(add-hook 'c-mode-hook 'my-company-c-setup)
(add-hook 'c++-mode-hook 'my-company-c-setup)

(setq company-c-headers-path-system
      '("/usr/include/c++/15"
        "/usr/include/x86_64-linux-gnu/c++/15"
        "/usr/include/c++/15/backward"
        "/usr/lib/gcc/x86_64-linux-gnu/15/include"
        "/usr/local/include"
        "/usr/include/x86_64-linux-gnu"
        "/usr/include"
        "/usr/include/x86_64-linux-gnu/qt5/"
        "/usr/include/x86_64-linux-gnu/qt6/"))

;=========================================================================================================

;===========================================SNIPPETS======================================================

(require 'competitive-programming-snippets)
(competitive-programming-snippets-init)

(use-package drag-stuff
  :init
  (drag-stuff-global-mode)
  (drag-stuff-define-keys))


(require 'flycheck)
(require 'flymake)
(require 'flylisp)
(require 'flyspell)
;;(add-hook 'prog-mode-hook
;;          (lambda ()
;;            (flyspell-prog-mode)
;;            (flylisp-prog-mode))
(require 'helm)
(require 'helm-lsp)
(require 'ido-completing-read+)
(require 'iedit)
(require 'lsp)
;;(add-hook 'c-mode-hook 'lsp)
;;(add-hook 'c++-mode-hook 'lsp)
(setq lsp-clients-clangd-args
      '("--background-index"
        "--fallback-flags=-std=c++20 -I/usr/include/c++/15 -I/usr/include/x86_64-linux-gnu/c++/15 -I/usr/include/c++/15/backward -I/usr/lib/gcc/x86_64-linux-gnu/15/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include"))

(require 'multiple-cursors)
(require 'mc-extras)
(global-set-key (kbd "C-S-j")       'mc/mark-all-dwim)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
(require 'which-key)
(require 'yasnippet)


;=======================================ORG MODE/LATEX====================================================

(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

(require 'org)
(require 'org-roam)
(require 'org-bullets)
(use-package org-bullets
  :hook (( org-mode ) . org-bullets-mode))

(org-roam-db-autosync-mode)

;;(setq org-odd-levels-only nil)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "POSTPONED" "WAITING" "SCHEDULED" "DONE")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red1" :weight bold))
        ("IN-PROGRESS" . (:foreground "blue3" :weight bold))
        ("POSTPONED" . (:foreground "dark orange" :weight bold))
        ("WAITING" . (:foreground "yellow" :weight bold))
        ("SCHEDULED" . (:foreground "cyan1" :weight bold))
        ("DONE" . (:foreground "green1" :weight bold))))

(require 'ob)
(require 'ob-awk)
(require 'ob-ada-spark-autoloads)
(require 'ob-python)   ; For Python
(require 'ob-ruby)     ; For Ruby
(require 'ob-java)     ; For Java
(require 'ob-js)       ; For JavaScript for some reason it is not working
(require 'ob-shell)    ; For Shell scripting
(require 'ob-perl)     ; For Perl
(require 'ob-C)        ; For C
(require 'ob-R)        ; For R
(require 'ob-sql)      ; For SQL
(require 'ob-latex)    ; For LaTeX
(require 'ob-haskell)  ; For Haskell
(require 'ob-octave)   ; For Octave
(require 'ob-scheme)   ; For Scheme
(require 'ob-clojure)  ; For Clojure
(require 'ob-lua)      ; For Lua
(require 'ob-swift)    ; For Swift
(require 'ob-fortran)  ; For Fortran
(require 'ob-go)       ; For Go
(require 'ob-dart)     ; For Dart
;;(require 'ob-scala)    ; For Scala I have no idea how to fix it so I can use it
(require 'ob-kotlin)   ; For Kotlin
;;(require 'ob-bash)     ; For Bash not needed as it uses natively ob-shell
(require 'ob-rust)     ; For Rust
(require 'ob-php)      ; For Php

(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (C . t)
   (R . t)
   (calc . t)
   (clojure . t)
   (css . t)
   (dart . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (eshell . t)
   (forth . t)
   (fortran . t)
   (gnuplot . t)
   (go . t)
   (groovy . t)
   (haskell . t)
   (java . t)
   ;;(javascript . t) not working
   (js . t)
   (julia . t)
   (kotlin . t)
   (latex . t)
   (lilypond . t)
   (lisp . t)
   (lua . t)
   (makefile . t)
   (maxima . t)
   (ocaml . t)
   (octave . t)
   (org . t)
   (perl . t)
   (php . t)
   (plantuml . t)
   (processing . t)
   (python . t)
   (ruby . t)
   (sass . t)
   ;;(scala . t) not working
   (scheme . t)
   (screen . t)
   (sed . t)
   (shell . t)
   (sql . t)
   (sqlite . t)
   (swift . t)))

;=========================================================================================================
(require 'ada-mode)
(require 'scala-mode)
(require 'd-mode)
(require 'yaml-mode)
(require 'glsl-mode)
(require 'tuareg)
(require 'lua-mode)
(require 'less-css-mode)
(require 'graphviz-dot-mode)
(require 'clojure-mode)
(require 'cmake-mode)
(require 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))
(require 'csharp-mode)
(require 'nim-mode)
(require 'jinja2-mode)
(require 'markdown-mode)
(require 'purescript-mode)
(require 'nix-mode)
(require 'dockerfile-mode)
(require 'toml-mode)
(require 'nginx-mode)
(require 'kotlin-mode)
(require 'go-mode)
(require 'php-mode)
(require 'racket-mode)
(require 'qml-mode)
(require 'ag)
(require 'elpy)
(require 'typescript-mode)
(require 'rfc-mode)
(require 'sml-mode)



(emms-all)
(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native
			    emms-info-metaflac
			    emms-info-ogginfo))

(setq confirm-kill-emacs 'y-or-n-p)

(setq c-default-style "stroustrup")
(setq c-basic-offset 4)

(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 . 85)))

(put 'upcase-region 'disabled nil)
