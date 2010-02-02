Ruby GeoIPCity Bindings
=======================

What?
-----

This is a library which provides a single function. The function takes as
input an IP address and it outputs a hash containing best-guess geographical
information (like city, country, latitude, and longitude).

Actually this is only a Ruby binding to a C library which provides this
function. Also, you must download a large binary database with all this
mapping information. It is kindly provided free of charge by MaxMind.com. 

Usage

    require 'geoip_city'
    db = GeoIPCity::Database.new('/opt/GeoIP/share/GeoIP/GeoLiteCity.dat')
    result = db.look_up('24.24.24.24')
    p result 
    # => {:country_code3=>"USA",
    #     :latitude=>40.6763000488281,
    #     :country_name=>"United States",
    #     :longitude=>-73.7751998901367,
    #     :region=>"NY",
    #     :dma_code=>501,
    #     :region_name=>"New York",
    #     :area_code=>718,
    #     :city=>"Jamaica",
    #     :country_code=>"US",
    #     :postal_code=>"11434"}

There are arguments to database initializer.

  1. The first argument is the filename of the GeoIPCity.dat file 

  2. The second argument (optional) is to specify how GeoIP should
     keep the database in memory. There are three possibilities

      * `:filesystem` -- Read database from filesystem, uses least memory.

      * `:index` -- The most frequently accessed index portion of the
        database, resulting in faster lookups than :filesystem, but less
        memory usage than :memory.

      * `:memory` -- (Default.) Load database into memory, faster performance but uses more memory.

  3. The third argument is boolean and decides whether the system should
     reload the database if changes are made to the dat file. (You probably
     don't need this. Default: false.)

For example 

    GeoIPCity::Database.new(dbfile, :filesystem, true)


Install
-------

Some variation of the following should work.

  1. Install the GeoCity C library. You can get it from
  [maxmind](http://www.maxmind.com/app/c).
  For example, I like to install mine in `/opt/GeoIP`, so I do this:

         tar -zxvf GeoIP-1.4.3.tar.gz 

         cd GeoIP-1.4.3

         ./configure --prefix=/opt/GeoIP

         make && sudo make install

  2. Now install the `geoip_city` gem 

         sudo gem install acamargo-geoip_city -s http://gems.github.com/ -- --with-geoip-dir=/opt/GeoIP

  3. Download the GeoLite City database file in binary format at http://www.maxmind.com/app/geolitecity
     Maybe this [direct link](http://www.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz) will work. 
     I put this file in 

         /opt/GeoIP/share/GeoIP/GeoLiteCity.dat

  4. Use it!

Hints
-----

  1. Might need to set

       export ARCHFLAGS="-arch i386"

     to be able to compile the gem.

  2. You might find [this shell
  script](http://github.com/grimen/my_shell_scripts/blob/8cf04cb6829e68a47f2d6f9d9e057766ea72beb4/install_geoip-city.sh)
     helpful to install the C library.

Links
-----

[rdocs](http://geoip-city.rubyforge.org/)

[git repo](https://github.com/ry/geoip-city/tree)

License 
-------
Copyright (C) 2007--2009 Ryan Dahl (ry@tinyclouds.org)

I give permission for you to do whatever you'd like to do with this software.
