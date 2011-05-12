# Manages (installs) all required resources for a LCGUTIL client.
# 
# == Examples
#
# Simply include this class, as in:
#   include lcgutil::client
# 
# == Authors
#
# CERN IT/GT/DMS <it-dep-gt-dms@cern.ch>
#
class lcgutil::client {
  package { "lcg-util": 
    name   => $grid_flavour ? { 
      "glite" => "lcg_util",
      default => $name,
    },
    ensure => latest, 
    notify => $grid_flavour ? {
      "glite" => Exec["glite_ldconfig"],
      default => undef,
    }
  }
}
