STOW := stow -v -t ~
PACKAGES := zsh git nvim foot sway tmux newsboat lf gtk w3m fonts starship
NO_FOLD_PACKAGES := joplin

.PHONY: all install uninstall restow $(PACKAGES) $(NO_FOLD_PACKAGES)

all: install

install:
	$(STOW) $(PACKAGES)
	$(STOW) --no-folding $(NO_FOLD_PACKAGES)

uninstall:
	$(STOW) -D $(PACKAGES) $(NO_FOLD_PACKAGES)

restow:
	$(STOW) -R $(PACKAGES)
	$(STOW) -R --no-folding $(NO_FOLD_PACKAGES)

$(PACKAGES):
	$(STOW) $@

$(NO_FOLD_PACKAGES):
	$(STOW) --no-folding $@
