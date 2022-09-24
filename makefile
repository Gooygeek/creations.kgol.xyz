
.PHONY: dev
dev:
	hugo server --buildDrafts --buildFuture

.PHONY: build
build:
	hugo --minify

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
