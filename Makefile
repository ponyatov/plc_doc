MODULE ?= HorizonPLC

..PHONY: doc
doc: doc/$(MODULE).pdf

doc/$(MODULE).pdf

# install
.PHONY: install update doc ref
install: ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)`
ref:
