desc "Populate slugs for existing Models"
task :sluggify => :environment do 
  
  #class DBlist
    #def self.run
      #connection = ActiveRecord::Base.connection
      #connection.tables.each do |table_name|
        #puts "\n" + table_name
        #connection.columns(table_name).each do |c|
          #if c.name == 'slug' && table_name != 'friendly_id_slugs'
            #puts c.name 
            #puts "Found a SLUG!"
          #else
            #puts c.name
          #end
        #end
      #end
    #end
  #end

  #DBlist.run

  class SlugFind
    def self.run
      connection = ActiveRecord::Base.connection
      connection.tables.each do |table_name|
        connection.columns(table_name).each do |c|
          if c.name == 'slug' && table_name != 'friendly_id_slugs'
            puts table_name
            table_name.classify.constantize.find_each(&:save)
          end
        end
      end
    end
  end


  SlugFind.run


  #this is handy to know...
  #connection.columns(table_name).each {|c| puts "- " + c.name + ":" + c.type.to_s + " " + c.limit.to_s}
end
