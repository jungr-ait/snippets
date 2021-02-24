# set-up texmaker

[follow these instructions](http://milq.github.io/install-latex-ubuntu-debian/)


# my version

```
$ sudo apt-get install texmaker
$ sudo apt-get install texlive texlive-lang-german texlive-latex-extra 
$ sudo apt-get install texlive texlive-lang-english texlive-science
$ sudo apt-get install texlive-publishers   # for IEEETrans.bsd
```

Configure texmaker to generate the results in a `build` directory. 
There is a [bug](https://tex.stackexchange.com/questions/85075/bibtex-error-in-texmaker-i-couldnt-open-file-name-test-bb-aux) with Bib(la)tex, as it cannot locate the `*.aux` file. 

The solution to modify the Bib(la)tex command to: `bibtex build/%.aux`.


