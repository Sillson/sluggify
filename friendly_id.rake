desc "Populate slugs for existing Models"
task :sluggify => :environment do 

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

end
