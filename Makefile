.PHONY: tag
tag:
	@if [ "$(TAG)" != "" ]; then \
		git tag -f $(TAG); \
		git push -f github $(TAG); \
	fi

export_l:
	DAOBOX_LOG=info,daobox_site=trace ~/Coder/yiibox/daobox-server-next/wz-server/target/debug/daobox-site serve \
		--work-dir ./dist \
		--dist-dir ./dist --export

preview:
	daobox-site serve

gen:
	daobox-site serve --export

