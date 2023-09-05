.PHONY: tag
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi

gen_l:
	DAOBOX_LOG=info,daobox_site=trace ~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-site serve \
		--dist-dir ./dist --export

preview:
	DAOBOX_LOG=info,daobox_site=trace ~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-site serve

web:
	~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-site web --work-dir dist
 
gen:
	daobox-site serve --export

