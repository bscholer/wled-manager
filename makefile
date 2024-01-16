target: build stop run logs

build:
	docker build . --file Dockerfile -t wled-backup-img

stop:
	- docker stop wled-backup
	- docker rm wled-backup

run:
	docker run -it -d --env-file=.env -v /home/bscholer/projects/wled-backup/:/backup --name wled-backup wled-backup-img

exec:
	docker exec -it wled-backup /bin/bash

logs:
	docker logs --follow wled-backup
