# coding: utf-8

namespace :demo do
  task :all => :environment do
    Rake::Task['db:migrate:reset'].invoke
    Rake::Task['demo:create_dish_types'].invoke
    Rake::Task['demo:create_dishes'].invoke
    Rake::Task['demo:create_restaurants'].invoke
  end
  
  task :create_dish_types => :environment do
    [
      {:chs => '湖南菜', :eng => 'Hu Nan Dish'},
      {:chs => '广东菜', :eng => 'Guang Dong Dish'},
      {:chs => '四川菜', :eng => 'Si Chuan Dish'}
    ].each do |lans_strings|
      DishType.create!(
        :name_sys_string => SysString.create_by_lans_strings(lans_strings)
      )
    end
  end
  
  task :create_dishes => :environment do
    [
      {:chs => '小炒肉', :eng => 'Light Fried Pork'},
      {:chs => '剁椒鱼头', :eng => 'Chilli Fish Head'}
    ].each do |lans_strings|
      Dish.create!(
        :dish_type => DishType.by_sym(:hu_nan_dish),
        :name_sys_string => SysString.create_by_lans_strings(lans_strings)
      )
    end
    
    [
      {:chs => '回锅肉', :eng => 'Hui Guo Pork'},
      {:chs => '水煮鱼', :eng => 'Chilli Boiling Fish'}
    ].each do |lans_strings|
      Dish.create!(
        :dish_type => DishType.by_sym(:si_chuan_dish),
        :name_sys_string => SysString.create_by_lans_strings(lans_strings)
      )
    end 
    
    [
      {:chs => '干炒牛河', :eng => 'Fried Beef Noodle'},
      {:chs => '烧鸭', :eng => 'Roasted Duck'}
    ].each do |lans_strings|
      Dish.create!(
        :dish_type => DishType.by_sym(:guang_dong_dish),
        :name_sys_string => SysString.create_by_lans_strings(lans_strings)
      )
    end    
  end
  
  task :create_restaurants => :environment do
    addr =  Address.find_or_create({
        :building_name => "Shop 1",
        :street_number => "202",
        :street_name => "Honeywood St",
        :suburb_name => "Sunnybank Hills",
        :state_name => "QLD",
        :postcode => 4109,
        :lat => "-27609854",
        :lng => "153055855"})
    name_strings = SysLanguageString.create!([
        {:string => "Jia Jia", :sys_language => SysLanguage.by_sym(:eng)},
        {:string => "佳佳", :sys_language => SysLanguage.by_sym(:chs)}
      ])
    rname = SysString.create!(
      :sys_language_strings => name_strings)

    Restaurant.create!(
      :name_sys_string => rname,
      :address => addr)

    addr =  Address.find_or_create({
        :building_name => "Shop 1a Market Square",
        :street_number => "341",
        :street_name => "Mains Rd",
        :suburb_name => "Sunnybank",
        :state_name => "QLD",
        :postcode => 4100,
        :lat => "-2757277",
        :lng => "153065296"})
    name_strings = SysLanguageString.create!([
        {:string => "Jia Wang", :sys_language => SysLanguage.by_sym(:eng)},
        {:string => "嘉旺", :sys_language => SysLanguage.by_sym(:chs)}
      ])
    rname = SysString.create!(
      :sys_language_strings => name_strings)

    Restaurant.create!(
      :name_sys_string => rname,
      :address => addr)
     
  end

  task :create_test_address => :environment do
    Address.find_or_create({
        :street_number => "36",
        :street_name => "Marsala St",
        :suburb_name => "Calamvale",
        :state_name => "QLD",
        :post_code => 4116,
        :lat => "-27611679",
        :lng => "153060426"
      })
  end
end
