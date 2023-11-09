.PHONY: tag dist
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi

work:
	EVERKM_LOG=info,everkm_publish=trace,everkm_markdown=trace \
		~/Coder/yiibox/daobox-server-next/wz-server/target/debug/everkm-publish \
		serve \
		--theme yilog

web:
	~/Coder/yiibox/daobox-server-next/wz-server/target/debug/everkm-publish web --work-dir dist
 
dist:
	everkm-publish serve \
		--theme yilog \
		--export

