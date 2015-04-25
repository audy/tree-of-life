# Tree of Life

A simple app for querying taxonomies based on NCBI taxonomy database. Capable of
handling many queries per second and is much simpler to use than the NCBI API.

Capable of building taxonomic descriptions from a name (such as "Tyrannosaurus")
or NCBI taxonomy id.

Returns taxonomy in JSON format.

### Example

```
$ curl http://localhost:9999/taxonomy/Tyrannosaurus%20rex

{"taxonomy":"cellular
organisms;Eukaryota;Opisthokonta;Metazoa;Eumetazoa;Bilateria;Coelomata;Deuterostomia;Chordata;Craniata;Vertebrata;Gnathostomata;Teleostomi;Euteleostomi;Sarcopterygii;Tetrapoda;Amniota;Sauropsida;Sauria;Archosauria;Dinosauria;Saurischia;Theropoda;Coelurosauria;Tyrannosauridae;Tyrannosaurus;Tyrannosaurus
rex"}
```

## Requirements

- Tested on Ruby 1.9.3 w/ bundler
- SQLite 3

## Getting Started

```
bundle # installs dependencies
rake db:migrate # creates database.sqlite

# download and extract names.dmp and nodes.dmp from
# ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz

# update database
rake update_database

# start webserver on port 9999
rackup
```

## LICENSE

The MIT License (MIT)

Copyright (c) 2012-2015 Austin G. Davis-Richardson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
