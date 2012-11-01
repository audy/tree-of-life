# Tree of Life

A simple app for building taxonomies based on NCBI taxonomy database.

Supports searching by name or taxonid

## Getting Started

- Setup/Install/Run MongoDB. By default this app will create a database
  called `taxondb` on the mongo server running on localhost. Edit
`environment.rb` to change this.
- `bundle install`
- Download `names.dmp` and `nodes.dmp`:
  `ftp://ftp.ncbi.nih.gov/pub/taxonomy/taxdump.tar.gz`
- run `rake update_database`
- run `rackup` to start the webserver
