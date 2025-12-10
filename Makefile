.PHONY: build clean serve

build:
	rm -rf output
	pelican content -o output -s pelicanconf.py
	rm -rf output/assets
	cp -r assets output/
	cp index.html output/
	cp -r errors output/

clean:
	rm -rf output

serve: build
	cd output && python -m http.server 8000
