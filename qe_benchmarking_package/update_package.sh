source $HOME/.virtualenvs/qe_analysis/bin/activate
python3 setup.py sdist bdist_wheel
python3 -m pip install --force-reinstall dist/qe_benchmarking-0.0.1-py3-none-any.whl
