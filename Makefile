SRC = $(wildcard ./*.ipynb)

all: hands_on_ml_src docs

hands_on_ml_src: $(SRC)
	nbdev_build_lib
	touch hands_on_ml_src

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist