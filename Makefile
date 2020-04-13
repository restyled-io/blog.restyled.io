.PHONY: deploy
deploy:
	stack exec blog clean
	stack exec blog build
	aws s3 sync --acl public-read _site s3://blog.restyled.io
