;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     (c-c++ :variables
            c-c++-enable-clang-support t)
     (git :variables
          git-gutter-use-fringe t)
     haskell
     html
     latex
     markdown
     org
     (osx :variables
          osx-use-option-as-meta nil) ;; Needed for GUI `⌥`
     python
     rust
     react
     shell
     syntax-checking
     themes-megapack
     my-monokai-theme
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(coffee-mode mips-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(toxi-theme)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.

  (add-to-list 'custom-theme-load-path "~/.emacs.d/private/my-monokai-theme/my-monokai-theme/")


  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(my-monokai
                         monokai
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key ","
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key "-"
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil

   dotspacemacs-line-numbers t
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;       Locale        ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Make the org calendar start on monday
  (setq calendar-week-start-day 1)

  ;; UTF-8 please
  (setq locale-coding-system 'utf-8) ; pretty
  (set-terminal-coding-system 'utf-8) ; pretty
  (set-keyboard-coding-system 'utf-8) ; pretty
  (set-selection-coding-system 'utf-8) ; please
  (prefer-coding-system 'utf-8) ; with sugar on top
  (set-language-environment 'utf-8)

  ;; Make the command key behave as Meta
  (setq mac-command-key-is-meta t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;        Utils        ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Sets the auto-save interval to 180 seconds or 300 characters
  (setq auto-save-interval 300)
  (setq auto-save-timeout 180)

  ;; Restore the current command echo rate
  (setq echo-keystrokes .1)


  ;; Make emacs follow directly any symlink
  (setq vc-follow-symlinks t)

  ;; Manually set Rust src path, as it looks like it's not able to detect it
  (add-hook 'rust-mode-hook (lambda () (interactive)
                              (setq company-racer-rust-src "~/Home/SDKs/rust/src")))

  (add-hook 'flycheck-mode-hook (lambda () (evil-leader/set-key (kbd "ev") 'my-functions/open-dotspacemacs-in-split)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;   Helper functions  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun my-functions/split-window-horizontally-and-switch ()
    (interactive)
    (split-window-horizontally)
    (other-window 1))

  (defun my-functions/open-dotspacemacs-in-split()
    "Opens the /.spacemacs file in a new vertical split"
    (interactive)
    (my-functions/split-window-horizontally-and-switch)
    (find-file "~/.spacemacs"))


  (defun my-functions/open-empty-buffer-in-new-split()
    "Opens a new vertical split with an empty buffer on it"
    (interactive)
    (let ((buf (generate-new-buffer "untitled")))
      (my-functions/split-window-horizontally-and-switch)
      (switch-to-buffer buf)))


  (defun my-functions/org-insert-source-block(arg)
    "Inserts a code block in org mode, asking for language, and then opens a
     vertical split with syntax-highlight for code editing"
    (interactive "p")
    (setq block-language (read-from-minibuffer "Language: "))
    (end-of-line)
    (open-line arg)
    (insert (concat "#+BEGIN_SRC " block-language ))
    (open-line arg)
    (next-line 1)
    (open-line arg)
    (next-line 1)
    (insert "#+END_SRC")
    (previous-line 1)
    (org-edit-special))

  (defun my-functions/open-help-file ()
    "Opens my help file in a new vertical split"
    (interactive)
    (my-functions/split-window-horizontally-and-switch)
    (find-file "~/Home/APUNTES/Otros/my-emacs.org"))


  (defun my-functions/set-powerline-arrow ()
    "Configures the Powerline separator"
    (progn
      (setq powerline-default-separator 'arrow-fade)
      (spaceline-compile)))

  (defun my-functions/full-screen ()
    (toggle-frame-fullscreen))


  (defun my-functions/gui-behaviour ()
    (progn
      (my-functions/set-powerline-arrow)
      (my-functions/full-screen)
      (global-set-key (kbd "M-+") 'spacemacs/scale-up-font)
      (global-set-key (kbd "M--") 'spacemacs/scale-down-font)
      (global-set-key (kbd "M-v") 'yank)
      (setq mac-command-modifier 'meta)))


  (defun my-functions/new-note ()
    (interactive)
    (let ((starting (format-time-string "%Y-%m-%d")))
      (setq subject (upcase (read-from-minibuffer "Assignatura: ")))
      (setq name (read-from-minibuffer "Nom: "))
      (setq filename (concat "~/Dropbox/2015-2016/APUNTES/" subject "/" starting "-" name ".org"))
      (my-functions/split-window-horizontally-and-switch)
      (find-file filename)
      (setq current-hour (format-time-string "%H:%M:%S"))
      (insert (concat "---\nlayout: post\ntitle: \"" name "\"\ndate: " starting " " current-hour "\ncategory: " subject "\n---\n* 1. "name "\n"))))

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;          UI         ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Run the functions defined for GUI version
  (if (string-equal window-system "mac") (my-functions/gui-behaviour))

  ;; Line numbers enabled by default
  ;; (setq dotspacemacs-line-numbers t)

  (setq dotspacemacs-leader-key ",")

  ;; Add little margin between line number and text
  (setq linum-format "%d ")

  ;; Add the current battery status to powerline
  (spacemacs/toggle-mode-line-battery)

  ;; Format the display time structure (Show HH:mm and not show the system load average)
  (setq display-time-format "%H:%M")
  (setq display-time-default-load-average nil)


  ;; Show the current time at the powerline
  (display-time-mode)


  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;     Key bindings    ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; <leader>w -> Save current file
  (evil-leader/set-key "w" 'save-buffer)

  ;; <leader>SPC -> Clear search highlight
  (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

  ;; <leader>ev -> Open vertical split and load .spacemacs
  (evil-leader/set-key (kbd "ev") 'my-functions/open-dotspacemacs-in-split)

  ;; H -> Beginning of line
  (define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)

  ;; L -> End of line
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)

  ;; Markdown SPC to fold-unfold
  (add-hook 'markdown-mode-hook 'outline-minor-mode)
  (evil-define-key 'normal markdown-mode-map (kbd "SPC") 'evil-toggle-fold)

  ;; C mode: hook to autocomplete
  (add-hook 'c-mode-hook 'auto-complete-mode)

  ;; Org mode SPC to fold-unfold
  (evil-define-key 'normal org-mode-map (kbd "SPC") 'evil-toggle-fold)

  ;; C-w n for new split with *scratch*
  (define-key evil-normal-state-map (kbd "C-w n") 'my-functions/open-empty-buffer-in-new-split)

  ;; Bind F8 to open neotree
  (global-set-key [f8] 'neotree-toggle)

  (setq org-src-fontify-natively t)

  ;; Bind "C-c s" in org mode to insert source block
  (evil-define-key 'normal org-mode-map (kbd "C-c s") 'my-functions/org-insert-source-block)

  ;; Avoid redefinition warnings
  (setq ad-redefinition-action 'accept)

  ;; Center buffer on search-next
  (defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

  ;; Bind ' for Go-To-Mark insted of Go-To-Mark-Line
  (define-key evil-normal-state-map "'" 'evil-goto-mark)

  ;; Bind <leader>hh to open the help file
  (evil-leader/set-key (kbd "hh") 'my-functions/open-help-file)

  ;; In C mode, bind gD to "find tag"
  (evil-define-key 'normal c-mode-map (kbd "gD") 'find-tag)

  ;; Bind C-c C-a C-n to "Create new note"
  (define-key evil-normal-state-map (kbd "C-c C-a C-n") 'my-functions/new-note)

  ;; Bind <leader>$ to multi-term
  (evil-leader/set-key (kbd "$") 'multi-term)

  ;; In ORG mode, bind <leader>ol to generate LaTeX images
  (evil-leader/set-key (kbd "ol") 'org-preview-latex-fragment)

  ;; AutoComplete delay
  (setq ac-delay 0.2)

  ;; Show line numbers by default
  (spacemacs/toggle-line-numbers-on)

  ;; Remap y$ to Y
  (setq dotspacemacs-remap-Y-to-y$ nil)

  ;; Set the insert cursor to bar
  (setq-default evil-insert-state-cursor 'bar)

  (eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/TODOS.org" "~/Home/TEMP/org/tutorial/tutorial.org")))
 '(package-selected-packages
   (quote
    (smeargle orgit org magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor pug-mode spinner hide-comnt haml-mode seq autothemer bind-map highlight undo-tree mips-mode yapfify uuidgen request py-isort osx-dictionary org-projectile org-download livid-mode skewer-mode simple-httpd live-py-mode link-hint intero hlint-refactor helm-hoogle eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump darkokai-theme company-ghci column-enforce-mode cargo zenburn-theme xterm-color ws-butler window-numbering web-mode ujelly-theme twilight-anti-bright-theme toml-mode toc-org tao-theme spacemacs-theme spaceline powerline racer rust-mode py-yapf planet-theme pip-requirements persp-mode organic-green-theme org-pomodoro alert org-plus-contrib open-junk-file omtose-phellack-theme neotree naquadah-theme multi-term move-text monokai-theme moe-theme material-theme markdown-toc markdown-mode majapahit-theme macrostep leuven-theme less-css-mode json-mode js2-refactor multiple-cursors js2-mode js-doc jazz-theme info+ indent-guide hl-todo hindent highlight-numbers help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-make projectile helm-descbinds helm-c-yasnippet helm-ag haskell-snippets gruvbox-theme grandshell-theme gotham-theme google-translate flycheck-rust flatui-theme farmhouse-theme expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-mc evil-matchit evil-iedit-state iedit evil-exchange eshell-prompt-extras emmet-mode dracula-theme darktooth-theme cyberpunk-theme company-tern tern company-racer company-quickhelp company-anaconda color-theme-sanityinc-tomorrow coffee-mode cmake-mode clang-format badwolf-theme auto-yasnippet auto-compile apropospriate-theme anti-zenburn-theme anaconda-mode ample-theme ace-window ace-link ace-jump-helm-line avy auto-complete auctex yasnippet ghc anzu smartparens haskell-mode flycheck company helm helm-core popup async hydra f dash s quelpa package-build use-package which-key evil zonokai-theme zen-and-art-theme web-beautify volatile-highlights vi-tilde-fringe underwater-theme twilight-theme twilight-bright-theme tronesque-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling slim-mode shm shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode purple-haze-theme professional-theme popwin pkg-info phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el pbcopy pastels-on-dark-theme parent-mode paradox page-break-lines packed osx-trash org-repo-todo org-present org-bullets oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme mustang-theme monochrome-theme molokai-theme mmm-mode minimal-theme lush-theme lorem-ipsum log4e linum-relative light-soap-theme launchctl json-snatcher json-reformat jbeans-theme jade-mode ir-black-theme inkpot-theme ido-vertical-mode hy-mode hungry-delete htmlize highlight-parentheses highlight-indentation heroku-theme hemisu-theme helm-mode-manager helm-flx helm-css-scss helm-company hc-zenburn-theme gruber-darker-theme goto-chg golden-ratio gnuplot gntp gh-md gandalf-theme flycheck-pos-tip flycheck-haskell flx-ido flatland-theme firebelly-theme fill-column-indicator fancy-battery evil-visualstar evil-tutor evil-numbers evil-nerd-commenter evil-lisp-state evil-indent-plus evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme esh-help elisp-slime-nav django-theme disaster diminish define-word deferred dash-functional darkmine-theme darkburn-theme dakrone-theme cython-mode company-web company-statistics company-ghc company-cabal company-c-headers company-auctex colorsarenice-theme color-theme-sanityinc-solarized cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme bind-key auto-highlight-symbol ample-zen-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
