PLUGIN_DIR := korean-anki
ARCHIVE := dist/$(PLUGIN_DIR).zip

.PHONY: all package zip clean

all: package

# Rebuild from scratch so deleted source files never linger in the ZIP.
package: $(PLUGIN_DIR)/.codex-plugin/plugin.json
	mkdir -p dist
	rm -f "$(ARCHIVE)"
	zip -q -r -X "$(ARCHIVE)" "$(PLUGIN_DIR)" \
		-x '*/.DS_Store' '*/._*' '*/__MACOSX/*' '*/.git/*'
	@echo "Created $(ARCHIVE)"

zip: package

clean:
	rm -f "$(ARCHIVE)"
