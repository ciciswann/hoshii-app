require 'rest-client'

Category.create!(name: 'Keyboard')
Category.create!(name: 'Keycap')
Category.create!(name: 'Switch')

def seed_keeb_gb
    keeb = RestClient.get 'https://mechgroupbuyswrapper.herokuapp.com/keyboards?status=live'

    keeb_array = JSON.parse(keeb)

    keeb_array.each do |keyboard|
        Groupbuy.create(
            name: keyboard["name"],
            start_date: keyboard["startDate"],
            end_date: keyboard["endDate"],
            pricing: keyboard["pricing"],
            sale_type: keyboard["saleType"],
            vendor: keyboard["vendors"],
            image: keyboard["mainImage"],
            category_id: Category.find(1)
        )
    end
end

def seed_kc_gb
    kc = RestClient.get 'https://mechgroupbuyswrapper.herokuapp.com/keycaps?status=live'

    kc_array = JSON.parse(kc)

    kc_array.each do |kc|
        Groupbuy.create(
            name: kc["name"],
            start_date: kc["startDate"],
            end_date: kc["endDate"],
            pricing: kc["pricing"],
            sale_type: kc["saleType"],
            vendor: kc["vendors"],
            image: kc["mainImage"],
            category_id: Category.find(2)
        )
    end
end

def seed_sgb
    s = RestClient.get 'https://mechgroupbuyswrapper.herokuapp.com/switches?status=live'

    s_array = JSON.parse(s)

    s_array.each do |s|
        Groupbuy.create(
            name: s["name"],
            start_date: s["startDate"],
            end_date: s["endDate"],
            pricing: s["pricing"],
            sale_type: s["saleType"],
            vendor: s["vendors"],
            image: s["mainImage"],
            category_id: Category.find(3)
        )
    end
end


seed_kc_gb
seed_keeb_gb
seed_sgb