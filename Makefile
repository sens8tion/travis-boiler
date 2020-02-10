HOST=127.0.0.1
TEST_PATH=./
MY_PROJECT="boondobble"

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	name '*~' -exec rm --force  {} 

clean-build:
	rm --force --recursive build/
	rm --force --recursive dist/
	rm --force --recursive *.egg-info

isort:
	sh -c "isort --skip-glob=.tox --recursive . "

lint:
	flake8 --exclude=.tox

test: clean-pyc
	py.test --verbose --color=yes $(TEST_PATH)

run:
	python manage.py runserver

docker-run:
	docker build \
		--file=./Dockerfile \
		--tag=$(MY_PROJECT) ./
	docker run \
		--detach=false \
		--name=$(MY_PROJECT) \
		$(MY_PROJECT)