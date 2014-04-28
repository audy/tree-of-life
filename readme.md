# Tree of Life

A simple app for building taxonomies based on NCBI taxonomy database.

Supports searching by name or taxonid

### Example

```
$ curl http://localhost:9999/taxonomy/Tyrannosaurus%20rex

{"taxonomy":"cellular
organisms;Eukaryota;Opisthokonta;Metazoa;Eumetazoa;Bilateria;Coelomata;Deuterostomia;Chordata;Craniata;Vertebrata;Gnathostomata;Teleostomi;Euteleostomi;Sarcopterygii;Tetrapoda;Amniota;Sauropsida;Sauria;Archosauria;Dinosauria;Saurischia;Theropoda;Coelurosauria;Tyrannosauridae;Tyrannosaurus;Tyrannosaurus
rex"}
```

## Getting Started

- Setup/Install/Run MongoDB. By default this app will create a database
  called `taxondb` on the mongo server running on localhost. Edit
`environment.rb` to change this.
- `bundle install`
- Download `names.dmp` and `nodes.dmp`:
  `ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz`
- run `rake update_database`
- run `rackup` to start the webserver

## LICENSE

The MIT License (MIT)

Copyright (c) 2012-2014 Austin G. Davis-Richardson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
