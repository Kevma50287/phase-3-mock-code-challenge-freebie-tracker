class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.find_by(item_name: item_name) ? true : false
    end

    def give_away(dev, freebie)
        if (self.received_one?(freebie.item_name))
            freebie.update(dev: dev)
        else
            "Can't give away what isn't yours >:( "
        end
    end
end
