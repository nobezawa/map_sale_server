class District < ActiveRecord::Base
  has_many :shops


  def self.create_sql_search_name(arr)
    sql = Array.new
    arr.each do |e|
      sql.push(self.search(:district_name_cont => e).result.to_sql)
    end
    sql
  end


end
