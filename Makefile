AWS ?= aws --profile restyled-ci

BUCKET = prod-blog-bucket-1o8fzacs0ws78
DISTRIBUTION_ID = E2D6D81PYCKLGG

.PHONY: deploy
deploy:
	stack exec blog clean
	stack exec blog build
	$(AWS) s3 sync --acl public-read --delete _site s3://$(BUCKET)
	$(AWS) cloudfront create-invalidation \
	    --distribution-id $(DISTRIBUTION_ID) --paths "/*"
