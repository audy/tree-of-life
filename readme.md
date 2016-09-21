# Tree of Life

A simple app for querying taxonomies based on NCBI taxonomy database. Capable of
handling many queries per second and is much simpler to use than the NCBI API.

Provides a web microservice that returns taxonomic descriptions when queried by
name (such as "Tyrannosaurus") or NCBI taxonomy id.

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

```bash
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

(c) 2012-2016 Austin G. Davis-Richardson <harekrishna@gmail.com>

MIT. See `LICENSE` for details.
