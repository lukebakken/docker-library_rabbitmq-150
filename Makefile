.PHONY: start stop

NAME ?= rmq-user-test

start:
	docker run --rm --publish 15672:15672 --env RABBITMQ_DEFAULT_USER=foobar --env RABBITMQ_DEFAULT_PASS=bazbat \
		--name $(NAME) \
		--mount type=bind,source="$(CURDIR)/rabbitmq.conf",target=/etc/rabbitmq/rabbitmq.conf,readonly \
		--mount type=bind,source="$(CURDIR)/definitions.json",target=/etc/rabbitmq/definitions.json,readonly rabbitmq:3-management

stop:
	docker stop $(NAME)
