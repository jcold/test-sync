.PHONY: tag dist
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi

work:
	DAOBOX_LOG=info,daobox_publish=trace,daobox_markdown=trace \
		~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-publish \
		serve \
		--theme yilog

web:
	~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-publish web --work-dir dist
 
dist:
	daobox-publish serve \
		--theme yilog \
		--export

