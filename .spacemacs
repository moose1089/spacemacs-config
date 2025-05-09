;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(graphviz
     (llm-client :variables llm-client-enable-gptel t)
     syntax-checking
     yaml
     markdown
     react
     clojure
     elixir
     nginx
     typescript
     rust
     csv
     sql
     ruby
     python
     go
     markdown
     javascript
     html
     common-lisp
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     (git
       :variables
       git-magit-status-fullscreen t
       git-enable-github-support t
       git-gutter-use-fringe t) 
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      string-inflection
                                      lsp-mode
                                      fireplace
                                      auto-complete
                                      restclient
                                      all-the-icons
                                      atomic-chrome
                                      ;; (copilot :location (recipe
                                      ;;                     :fetcher github
                                      ;;                     :repo "zerolfx/copilot.el"
                                      ;;                    :files ("*.el" "dist")))
                                        ;lsp-ui
                                        ;lsp-treemacs
                                      ;;flycheck
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-magit magit)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 7)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         cyberpunk)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; Was Consolas

   dotspacemacs-default-font '("MonaspaceNeon"
                               :size 22
                               :weight light
                               :width normal
                               :powerline-scale 4.0)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 't
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
 )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (menu-bar-mode 1)
  (setq org-log-done 'time)
  (setq org-todo-keywords '((sequence "TODO" "REVIEW" "|" "DONE")))

  ;; powerline size
  ;;(set-face-attribute 'mode-line nil :height 140)  ; Set height as desired

  ;(setq cljr-inject-dependencies-at-jack-in nil)

  (global-prettify-symbols-mode 1)
  ;(global-linum-mode)

   ;; jr0cket: text scaling keybindings
  (define-key global-map (kbd "C-+") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease)

  ;; Cycle case
  (global-set-key (kbd "C-`") 'string-inflection-all-cycle)
  (global-set-key (kbd "C-#") 'string-inflection-lisp)

  ;; smartparens keybindings
  (define-key global-map (kbd "<C-f12>") 'sp-forward-slurp-sexp)
  (define-key global-map (kbd "<C-f11>") 'sp-backward-slurp-sexp)
  (define-key global-map (kbd "<M-f12>") 'sp-forward-barf-sexp)
  (define-key global-map (kbd "<M-f11>") 'sp-backward-barf-sexp)
  (define-key global-map (kbd "C-]") 'sp-unwrap-sexp)

  (define-key global-map (kbd "<C-M-insert>") 'sp-copy-sexp)

  ;; jr0cket: keybindings for cycling buffers
  (global-set-key [C-prior] 'previous-buffer)
  (global-set-key [C-next] 'next-buffer)

  (define-key global-map (kbd "C-<tab>") 'company-complete)
  (define-key global-map (kbd "C-f") 'isearch-forward-regexp)
  (define-key global-map (kbd "C-r") 'isearch-backward-regexp)
  (define-key global-map (kbd "C-M-f") 'isearch-forward)
  (define-key global-map (kbd "C-M-f") 'isearch-backward)
  (define-key isearch-mode-map (kbd
                                "C-f") 'isearch-repeat-forward)

  (set-fill-column 60)

  ;; You know, like Readline.
  (global-set-key (kbd "C-M-h") 'backward-kill-word)


  (define-key global-map (kbd "<S-down-mouse-1>") 'mouse-save-then-kill)

  ;; turn off overwrite mode
  (define-key global-map [(insert)] nil)
  (define-key global-map [(control insert)] 'overwrite-mode)

;;  (define-key global-map (kbd "<M-RET>=") 'cider-format-defun)
  (define-key global-map (kbd "<M-RET>fd") 'cider-format-defun)
  (define-key global-map (kbd "<f12>") 'cider-eval-defun-at-point)
  (define-key global-map (kbd "C-M-y") 'transpose-sexps)

 ;; define function to shutdown emacs server instance
  (defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )


;; ellama

  ;; (use-package ellama
  ;;   :init
  ;;   ;; setup key bindings
  ;;   (setopt ellama-keymap-prefix "C-c e")
  ;;   (require 'llm-ollama)
  ;;   )

  (defvar my-flip-symbol-alist
  '(("true" . "false")
    ("false" . "true")
    ("True" . "False")
    ("False" . "True")
    ("read" . "write")
    ("rollback" . "commit")
    ("commit" . "rollback")
    ("production" . "staging")
    ("staging" . "development")
    ("development" . "production")
    (0 . 1)
    (1 . 0)
    ("begin" . "end")
    ("end" . "begin")
    ))


  (defun fix-font ()
    (interactive)
    (set-frame-font "-UKWN-Monaspace Neon-light-normal-normal-*-25-*-*-*-m-0-fontset-auto5" nil t))

  (defun my-flip-symbol ()
    "\"I don't want to type here, just do it for me.\""
    (interactive)
    (-let* (((beg . end) (bounds-of-thing-at-point 'symbol))
            (sym (buffer-substring-no-properties beg end)))
      (when (member sym (cl-loop for cell in my-flip-symbol-alist
                                 collect (car cell)))
        (delete-region beg end)
        (insert (alist-get sym my-flip-symbol-alist "" nil 'equal)))))

  (defun transpose-buffers (arg)
    "Transpose the buffers shown in two windows."
    (interactive "p")
    (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
      (while (/= arg 0)
        (let ((this-win (window-buffer))
              (next-win (window-buffer (funcall selector))))
          (set-window-buffer (selected-window) next-win)
          (set-window-buffer (funcall selector) this-win)
          (select-window (funcall selector)))
        (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

  (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
  (ws-butler-global-mode)

  (global-display-line-numbers-mode 1)

  ;; undo tree is too slow to use.
  (global-undo-tree-mode -1)
  (evil-set-undo-system 'undo-redo)

;  (cua-mode t)
  (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
  (transient-mark-mode 1) ;; No region when it is not highlighted
  (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

   ;; cycle through buffers with Ctrl-Tab (like Firefox)
  ;(global-set-key (kbd "<C-tab>") 'bury-buffer)

  (global-set-key (kbd "<C-f4>") 'kill-this-buffer)
  (global-set-key (kbd "<M-f4>") 'save-buffers-kill-terminal)
  ;;(global-set-key (kbd "C-a") 'mark-whole-buffer)
  ;;(global-set-key (kbd "C-w") 'kill-this-buffer)
  (global-set-key (kbd "C-n") 'spacemacs/new-empty-buffer)
  ;;  (global-set-key (kbd "C-o") 'ido-find-file)
  (global-set-key (kbd "C-o") 'helm-find-files)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-y") 'redo)
  (global-set-key (kbd "C-z") 'undo)
  (global-set-key (kbd "C-c C-/") 'my-flip-symbol )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun insert-iso-date ()
    "Insert the current date in ISO6801 format."
    (interactive)
    (insert (format-time-string "%Y-%m-%d")))
  (global-set-key (kbd "M-#") 'insert-iso-date)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; abbrevs - fix
  (define-abbrev global-abbrev-table "#li" "(log/info )")


  (setq cljr-warn-on-eval nil)
  (setq markdown-command-needs-filename 't)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil))) ;; one line at a time

  ;; lsp config
  (add-hook 'clojure-mode-hook 'lsp)
  ;; (setq lsp-lens-enable t)
  ;; (setq lsp-log-io t)
  (setq lsp-keymap-prefix "M-s-l")
  (use-package lsp-mode
    :custom (lsp-semgrep-languages '()))

  ;; ollama gptel
  ;; (setq
  ;;  gptel-model 'ollama:latest
  ;; gptel-backend)
  ;; (gptel-make-ollama "ollama"             ;Any name of your choosing
  ;;   :host "localhost:11434"               ;Where it's running
  ;;   :stream t                             ;Stream responses
  ;;   :models '(codestral:latest))          ;List of models


  (setq gc-cons-threshold (* 2 1024 1024 1024))
  (defmacro k-time (&rest body)
    "Measure and return the time it takes evaluating BODY."
    `(let ((time (current-time)))
       ,@body
       (float-time (time-since time))))

  (run-with-idle-timer 30 t
                       (lambda ()
                         (message "Garbage Collector has run for %.03fsec"
                                  (k-time (garbage-collect)))))

  ;; (setq gc-cons-threshold (* 100 1024 1024)
  ;;       read-process-output-max (* 1024 1024)
  ;;       treemacs-space-between-root-nodes nil
  ;;       company-minimum-prefix-length 2
  ;;       lsp-lens-enable t
  ;;       lsp-signature-auto-activate nil
  ;;                                       ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
  ;;                                       ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
  ;;       )

  ;; add to
  ;; ./elpa/clojure-mode-20170407.312/clojure-mode.el
  (setq clojure-symbols-list '(lambda ()
                                (mapc (lambda (pair) (push pair prettify-symbols-alist))
                                      '(("fn"  . ?λ)
                                        ("true". ?⊤)
                                        ("false".?⊥)
                                        ("partial". ?Ƥ)
                                        ;("for". ?∀)
                                        ("not=". ?≠)
                                        ("nil". ?Ø)
                                        ("->". ?→)
                                       ;#("some?". ?∃)
                                        ("->>". ?⇒))
                                      )))

  (add-to-list 'auto-mode-alist '("\\.restclient" . restclient-mode))

  (add-hook 'clojure-mode-hook clojure-symbols-list)
  (add-hook 'clojure-mode-hook (lambda () (cua-mode t)))
  (add-hook 'focus-in-hook (lambda () (cua-mode t)))
  (global-auto-highlight-symbol-mode t)
  (global-prettify-symbols-mode 1)
  (spacemacs/toggle-automatic-symbol-highlight-on)
  (add-hook 'yaml-mode-hook (lambda ()
                              (highlight-indentation-mode)
                              (set-face-background 'highlight-indentation-face "#004d00")))

  (add-hook 'prog-mode-hook 'smartparens-strict-mode)

  ;; accept completion from copilot and fallback to company
  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))

  ;; (with-eval-after-load 'copilot
  ;;   (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  ;;   (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
  ;;   (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
  ;;   (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word))

  ;; (global-set-key (kbd "C-!") 'copilot-complete)
  ;; (global-set-key (kbd "C-\"") 'copilot-next-completion)

  ;; (add-hook 'prog-mode-hook 'copilot-mode)

  )



(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-idle-interval 1.0)
 '(cider-print-options '(("length" 50) ("right-margin" 70)))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(evil-toggle-key "C-`")
 '(evil-want-Y-yank-to-eol nil)
 '(garbage-collection-messages t)
 '(js2-bounce-indent-p t)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil)
 '(lsp-clojure-custom-server-command '("/home/mark/bin/clojure-lsp"))
 '(lsp-clojure-server-store-path "/home/mark/bin/")
 '(lsp-log-io t)
 '(org-export-async-init-file
   "/home/mark/.emacs.d/layers/+emacs/org/local/org-async-init.el" t)
 '(org-export-with-toc nil)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")))
 '(package-selected-packages
   '(graphviz-dot-mode atomic-chrome websocket treemacs lsp-treemacs lsp-ui lsp-mode slime-company slime common-lisp-snippets tide typescript-mode string-inflection transient cython-mode csv-mode company-go go-mode company-anaconda lv sesman parseedn parseclj a chruby cargo markdown-mode rust-mode bundler inf-ruby anaconda-mode pythonic nginx-mode ob-elixir alchemist elixir-mode yapfify yaml-mode winum unfill toml-mode sql-indent rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pos-tip pyvenv pytest pyenv-mode py-isort pip-requirements org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mmm-mode minitest markdown-toc live-py-mode hy-mode htmlize helm-pydoc go-guru go-eldoc gnuplot gh-md fuzzy clj-refactor project-persist-drawer voca-builder company-irony-c-headers color-identifiers-mode helm-cider-history helm-cider ac-cider cider-eval-sexp-fu cider-hydra cider cider-decompile web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data smeargle orgit org mwim magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor company-statistics company clojure-snippets inflections edn multiple-cursors paredit peg queue clojure-mode auto-yasnippet yasnippet ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))
 '(safe-local-variable-values
   '((ffip-patterns "*.org" "*.rb" "*.sh" "*.md" "*.css" "*.scss" "Rakefile" "Procfile" "Capfile" "*.sql" "*.json" "*.haml" "*.js")
     (ffip-find-options . "-not -regex \".*out-.*\"")
     (eval define-clojure-indent
           (ANY 'defun))
     (eval define-clojure-indent
           (DELETE 'defun))
     (eval define-clojure-indent
           (POST 'defun))
     (eval define-clojure-indent
           (PUT 'defun))
     (eval define-clojure-indent
           (GET 'defun))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 151 :width normal)))))
)
