.PHONY: tag dist
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi


ifneq (, $(shell echo $$DEBUG))
  EKMP = "/Users/dayu/Coder/yiibox/daobox-server-next/wz-server/target/debug/everkm-publish"
else
  EKMP = ./node_modules/.bin/everkm-publish
endif

work:
	$(EKMP) \
		serve \
		--theme yilog

preview:
	$(EKMP) web --work-dir dist
 
dist:
	$(EKMP) serve \
		--theme yilog \
		--export

