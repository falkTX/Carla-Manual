
all: build

build: html resources

html: ../manuals/carla.html
resources: $(patsubst %,../%,$(wildcard screenshots/manual/*.png))

../manuals/carla.html: *.adoc
	asciidoc \
		--no-header-footer \
		--out-file=../manuals/carla.html \
		Manual.adoc

../screenshots/manual/%.png: screenshots/manual/%.png
	cp -v $< $@

clean:

watch:
	while true; do make; sleep 1; done
