.PHONY: init
init:
	mkdir -p themes
	git clone https://github.com/Gooygeek/hugo-creations themes/hugo-creations

.PHONY: dev
dev:
	hugo server --buildDrafts --buildFuture

.PHONY: dev+search
dev+search:
	rm -r public
	hugo --buildDrafts --buildFuture
	npx pagefind --source public --serve

.PHONY: build
build:
	hugo --minify
	npx pagefind --source public

# Upload to GCP
.PHONY: publish
publish: build
	gcloud auth login
	gsutil rsync -d -r public gs://creations.kgol.xyz

# Upload to GCP
.PHONY: publish-wsl
publish-wsl: build
	cmd.exe /C "gcloud auth login"
	cmd.exe /C "gsutil rsync -d -r public gs://creations.kgol.xyz"
