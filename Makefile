# make gh-pages in repo base directory to automatically build and deploy documents to github

gh-pages:
	echo "Make gh-pages"
	git checkout gh-pages
	rm -rf _sources _static
	git checkout master docs
	git reset HEAD
	cd docs; make html
	mv -fv docs/_build/html/* .
	rm -rf docs/
	git add -A
	git commit -m "Generated gh-pages for `git log master -1 --pretty=short --abbrev-commit`" && git push origin gh-pages ; git checkout master