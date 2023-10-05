.PHONY: tag
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi

gen_l:
	DAOBOX_LOG=info,daobox_publish=trace ~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-publish serve \
		--theme yilog \
		--dist-dir ./dist \
		--export

preview:
	DAOBOX_LOG=info,daobox_publish=trace,daobox_markdown=trace \
		~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-publish \
		serve \
		--theme yilog

web:
	~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-publish web --work-dir dist
 
gen:
	daobox-publish serve \
		--theme yilog \
		--export

