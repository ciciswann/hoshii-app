require 'rest-client'

Category.create!(name: 'Keyboard')
Category.create!(name: 'Keycap')
Category.create!(name: 'Switch')

def seed_groupbuys(url)
    
    groupbuy = RestClient.get(url)

    groupbuy_array = JSON.parse(groupbuy)

    groupbuy_array.each do |groupbuy|
        Groupbuy.create!(
            name: if_null(groupbuy["name"]),
            start_date: if_null(groupbuy["startDate"]),
            end_date: if_null(groupbuy["endDate"]),
            pricing: price_to_f(groupbuy["pricing"]),
            sale_type: if_null(groupbuy["saleType"]),
            vendor: if_null(groupbuy["vendors"]),
            image: groupbuy["mainImage"],
            status: set_status(url),
            category_id: set_category(groupbuy["type"])
        )
    end
end

def price_to_f(str)
    price = str.gsub("Base: ","").to_f
end

def set_category(type)
    if type == "keyboards"
        return 1
    elsif type == "keycaps"
        return 2
    elsif type == "switches"
        return 3
    end
end

def if_null(str)
    if str.blank? || str.length < 1
        return "Not Available"
    else 
        return str
    end
end

def set_status(url)
    if url.include? "live"
        return "live"
    elsif url.include? "upcoming"
        return "upcoming"
    elsif url.include? "ic"
        return "ic"
    elsif url.include? "ended"
        return "ended"
    end
end

#### SEED DATABASE ####

seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keyboards?status=live')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keyboards?status=upcoming')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keyboards?status=ic')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keyboards?status=ended')

seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keycaps?status=live')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keycaps?status=upcoming')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keycaps?status=ic')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/keycaps?status=ended')

seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/switches?status=live')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/switches?status=upcoming')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/switches?status=ic')
seed_groupbuys('https://mechgroupbuyswrapper.herokuapp.com/switches?status=ended')