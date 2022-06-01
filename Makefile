all:
install:
	for dir in `find * -type d -prune`; do \
		cd "$$dir"; \
		make install; \
		cd ../; \
	done
