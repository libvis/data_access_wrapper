modname = data_access_wrapper
front_src = $(libvis-mods where --front)
back_src = $(libvis-mods where --back)

install:
	libvis_mods install

requirements: req_py req_js
	@echo "Installed requirements"

req_py:
	pip3 install -r py_requirements.txt --user

req_js:
	cd $(front_src)/$(modname) &&\
		[ -s js_requirements.txt ] && {cat js_requirements.txt | xargs yarn add}


