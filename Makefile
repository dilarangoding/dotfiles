STOW := stow -v -t ~
PACKAGES := zsh git sway i3status foot gtk fonts nvim
NO_FOLD_PACKAGES := bin

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
