class HasStocked
    include Guacamole::Edge
  
    from :local_storages
    to   :medicines
end