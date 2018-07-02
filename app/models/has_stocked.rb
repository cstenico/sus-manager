class HasStocked
    include Guacamole::Edge
  
    from :medicines
    to   :local_storages
end