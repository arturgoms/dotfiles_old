;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(package! matlab-mode)

(package! org-roam-server)

(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))

;; When using org-roam via the `+roam` flag
(unpin! org-roam company-org-roam)
(unpin! bibtex-completion helm-bibtex ivy-bibtex)

(package! org-journal)
(package! org-kanban
  :recipe (:host github :repo "gizmomogwai/org-kanban"))
(package! org-pdftools
  :recipe (:host github :repo "fuxialexander/org-pdftools"))
(package! org-ref
  :recipe (:host github :repo "jkitchin/org-ref"))
(package! org-noter
  :recipe (:host github :repo "weirdNox/org-noter"))
(package! org-noter-pdftools
  :recipe (:host github :repo "fuxialexander/org-pdftools"))

(package! evil-tutor)
(package! pyvenv)
(package! flycheck-aspell)
(package! async)
(package! calfw)
(package! calfw-org)
(package! dash)
(package! dashboard)
(package! dired-open)
(package! dired-subtree)
(package! dmenu)
(package! elfeed-goodies)
(package! elpher)
(package! emojify)
(package! esxml)
(package! evil-tutor)
(package! ivy-posframe)
(package! mw-thesaurus)
(package! org-board)
(package! org-web-tools)
(package! ox-gemini)
(package! pacmacs)
(package! peep-dired)
(package! password-store)
(package! rainbow-mode)
(package! request)
(package! resize-window)
(package! s)
(package! tldr)
(package! wc-mode)
(package! beacon)
(package! clippy)
(package! minimap)
(package! nim-mode)
(package! poetry)
;; -*- no-byte-compile: t; -*-
;;; os/tty/packages.el

(if (featurep! +osc)
    (package! clipetty
      :recipe (:host github :repo "spudlyo/clipetty")
      :pin "01b39044b9b65fa4ea7d3166f8b1ffab6f740362")
  ;; Despite its name, this works for macOS as well.
  (package! xclip :pin "ef2ad92f3157d40b6d12c7e8485d633eaae7fc45"))

(when (featurep! :editor evil)
  (package! evil-terminal-cursor-changer
    ;; HACK Fix #3845: original package is abandoned. This fork fixes a breaking
    ;;      bug that crashes the first terminal frame opened from the daemon.
    :recipe (:host github :repo "kisaragi-hiu/evil-terminal-cursor-changer")
    :pin "24755a18a311226933946f7218684dab5960ebc9"))
