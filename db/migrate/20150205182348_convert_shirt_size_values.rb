class ConvertShirtSizeValues < ActiveRecord::Migration
  
  def change
  end
  
  def data
    map = {
      :s => :s,
      :m => :m,
      :l => :l,
      :xl => :xl,
      :xxl => '2xl',
      :xxxl => '3xl',
      :xxxxl => '4xl'
    }
    
    Person.all.each do |person|
      person.shirt_size = map[person.shirt_size]
      person.save
    end
  end
end
